# Genera dist\KyaUI-Package-v<version>.zip listo para repartir.
# Uso:  .\tools\build.ps1
$ErrorActionPreference = 'Stop'

$root    = Split-Path $PSScriptRoot -Parent
$dist    = Join-Path $root 'dist'
$staging = Join-Path $dist 'KyaUI-Package'

# Version desde el .toc
$toc = Get-Content (Join-Path $root 'KyaUI\KyaUI.toc')
$version = ($toc | Select-String -Pattern '^##\s*Version:\s*(.+)$').Matches.Groups[1].Value.Trim()
if (-not $version) { throw "No se pudo leer '## Version' de KyaUI.toc" }

Write-Host "Empaquetando KyaUI v$version..."

if (Test-Path $staging) { Remove-Item $staging -Recurse -Force }
New-Item -ItemType Directory -Force -Path $staging | Out-Null

# Addons de terceros (Skada, xCT+, plugins de ElvUI que el launcher no reparte, ...).
# ElvUI NO va aqui: lo instala el usuario desde el Ascension Launcher y es dependencia.
Get-ChildItem (Join-Path $root 'vendor') -Directory | ForEach-Object {
    robocopy $_.FullName (Join-Path $staging $_.Name) /E /XF *.bak /NFL /NDL /NJH /NJS /NP | Out-Null
}
# El propio addon
robocopy (Join-Path $root 'KyaUI') (Join-Path $staging 'KyaUI') /E /XF *.bak /NFL /NDL /NJH /NJS /NP | Out-Null

# Instrucciones en la raiz del zip
Copy-Item (Join-Path $root 'vendor\INSTALL.txt') $staging -Force -ErrorAction SilentlyContinue
Copy-Item (Join-Path $root 'README.md')          $staging -Force

# Actualizador: el usuario lo tiene desde la primera instalacion
Copy-Item (Join-Path $root 'launcher\KyaUI-Launcher.bat') $staging -Force
Copy-Item (Join-Path $root 'launcher\KyaUI-Update.ps1')   $staging -Force

$zip = Join-Path $dist "KyaUI-Package-v$version.zip"
if (Test-Path $zip) { Remove-Item $zip -Force }
Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $zip -CompressionLevel Optimal

$mb = [math]::Round((Get-Item $zip).Length / 1MB, 1)
Write-Host "OK -> $zip ($mb MB)"

# robocopy devuelve 1 en copias correctas; no dejar que ensucie el codigo de salida
exit 0
