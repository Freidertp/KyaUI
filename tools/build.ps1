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

# Las carpetas de addon estan en la RAIZ del repo, que es la estructura que espera el
# catalogo de Ascension (ver Ascension-Addons/ElvUI). Se detectan por su .toc, igual que
# hace WoW: asi tools\, launcher\ y dist\ quedan fuera sin listarlas a mano, y un addon
# nuevo entra en el paquete solo con dejarlo en la raiz.
# ElvUI NO esta aqui: lo instala el usuario desde el Ascension Launcher y es dependencia.
$addons = Get-ChildItem $root -Directory | Where-Object {
    Get-ChildItem $_.FullName -Filter *.toc -File -ErrorAction SilentlyContinue | Select-Object -First 1
}
if (-not $addons) { throw "No se encontro ninguna carpeta de addon (con .toc) en la raiz" }

foreach ($a in $addons) {
    robocopy $a.FullName (Join-Path $staging $a.Name) /E /XF *.bak /NFL /NDL /NJH /NJS /NP | Out-Null
}
Write-Host "  addons empaquetados: $($addons.Count) ($(($addons | ForEach-Object { $_.Name }) -join ', '))"

# Instrucciones en la raiz del zip
Copy-Item (Join-Path $root 'INSTALL.txt') $staging -Force -ErrorAction SilentlyContinue
Copy-Item (Join-Path $root 'README.md')   $staging -Force

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
