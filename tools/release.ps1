# Publica una version de KyaUI: empaqueta, etiqueta y crea la release en GitHub.
#
# Uso:  .\tools\release.ps1
#       .\tools\release.ps1 -Notes "Enter/Esc en los dialogos de Auctionator"
#
# La version sale de '## Version' en KyaUI\KyaUI.toc: subela ANTES de publicar.
# Requiere git con un remoto configurado y la CLI 'gh' autenticada (gh auth login).
param(
    [string]$Notes,
    [switch]$AllowDirty,
    [switch]$DryRun
)
$ErrorActionPreference = 'Stop'

$root = Split-Path $PSScriptRoot -Parent

# Version desde el .toc (misma fuente que build.ps1)
$toc = Get-Content (Join-Path $root 'KyaUI\KyaUI.toc')
$version = ($toc | Select-String -Pattern '^##\s*Version:\s*(.+)$').Matches.Groups[1].Value.Trim()
if (-not $version) { throw "No se pudo leer '## Version' de KyaUI.toc" }
$tag = "v$version"

Write-Host "Publicando KyaUI $tag"

# --- comprobaciones antes de tocar nada ---------------------------------

$dirty = git -C $root status --porcelain
if ($dirty -and -not $AllowDirty) {
    Write-Host $dirty
    throw "Hay cambios sin commitear. Haz commit antes de publicar (o pasa -AllowDirty)."
}

$existing = git -C $root tag --list $tag
if ($existing) { throw "El tag $tag ya existe. Sube '## Version' en KyaUI.toc." }

$remote = git -C $root remote
if (-not $remote) {
    throw "Este repo no tiene remoto. Crealo con:  gh repo create KyaUI --public --source . --push"
}
$remoteName = ($remote | Select-Object -First 1)

$hasGh = [bool](Get-Command gh -ErrorAction SilentlyContinue)
if (-not $hasGh) {
    Write-Host "Aviso: no esta la CLI 'gh'. Se empaquetara y etiquetara, pero la release habra" -ForegroundColor Yellow
    Write-Host "       que crearla a mano en la web (te digo al final que subir)." -ForegroundColor Yellow
}

# --- empaquetar ---------------------------------------------------------

& (Join-Path $PSScriptRoot 'build.ps1')

$zip = Join-Path $root "dist\KyaUI-Package-v$version.zip"
if (-not (Test-Path $zip)) { throw "build.ps1 no genero $zip" }

if ($DryRun) {
    Write-Host "DryRun: aqui se etiquetaria $tag y se subiria $zip"
    exit 0
}

# --- etiquetar y publicar ----------------------------------------------

git -C $root tag $tag
if ($LASTEXITCODE -ne 0) { throw "Fallo 'git tag $tag'" }

git -C $root push $remoteName HEAD
if ($LASTEXITCODE -ne 0) { throw "Fallo el push de la rama" }

git -C $root push $remoteName $tag
if ($LASTEXITCODE -ne 0) { throw "Fallo el push del tag" }

if (-not $hasGh) {
    $url = (git -C $root remote get-url $remoteName) -replace '\.git$', ''
    Write-Host ""
    Write-Host "Tag $tag subido. Falta crear la release a mano:" -ForegroundColor Yellow
    Write-Host "  1. Abre  $url/releases/new?tag=$tag"
    Write-Host "  2. Adjunta  $zip"
    Write-Host "  3. Publica"
    Write-Host ""
    Write-Host "(Con 'gh' instalado esto seria automatico: https://cli.github.com)"
    exit 0
}

$ghArgs = @('release', 'create', $tag, $zip, '--title', "KyaUI $tag")
if ($Notes) {
    $ghArgs += @('--notes', $Notes)
} else {
    $ghArgs += '--generate-notes'
}

& gh @ghArgs
if ($LASTEXITCODE -ne 0) {
    throw "Fallo 'gh release create'. El tag ya esta subido: puedes crear la release a mano y adjuntar $zip"
}

Write-Host ""
Write-Host "OK -> release $tag publicada. Los usuarios la recibiran al abrir KyaUI-Launcher.bat" -ForegroundColor Green
