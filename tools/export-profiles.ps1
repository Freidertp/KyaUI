# Extrae una tabla de un SavedVariables de WoW y la escribe como Profiles\data_*.lua.
#
# Ejemplo (perfil de Skada llamado "MerfinUI v(Normal)7.05"):
#   .\tools\export-profiles.ps1 `
#       -Source 'D:\Games\WoWAscension\resources\ascension-live\WTF\Account\KYAROPLAY@GMAIL.COM\SavedVariables\Skada.lua' `
#       -Anchor '\["MerfinUI v\(Normal\)7\.05"\] = \{' `
#       -Var 'KyaUI.SkadaData' `
#       -Out 'KyaUI\Profiles\data_skada.lua'
#
# -Anchor es una regex que debe casar con la linea `["loquesea"] = {` que abre la tabla
# a extraer. Se copia el bloque {...} balanceado que empieza ahi.
# OJO: el juego escribe WTF\ al salir. Cierra WoW antes de exportar.
param(
    [Parameter(Mandatory)] [string]$Source,
    [Parameter(Mandatory)] [string]$Anchor,
    [Parameter(Mandatory)] [string]$Var,
    [Parameter(Mandatory)] [string]$Out,
    [string]$Comment = 'Generado automaticamente por tools/export-profiles.ps1. NO editar a mano.'
)
$ErrorActionPreference = 'Stop'

$text = [System.IO.File]::ReadAllText($Source)

$m = [regex]::Match($text, $Anchor)
if (-not $m.Success) { throw "El ancla no casa con nada en $Source" }

$open = $text.IndexOf('{', $m.Index)
if ($open -lt 0) { throw "No se encontro '{' despues del ancla" }

# Recorre contando llaves, ignorando las que estan dentro de cadenas "..."
$depth = 0; $inStr = $false; $i = $open
while ($i -lt $text.Length) {
    $c = $text[$i]
    if ($inStr) {
        if ($c -eq '\') { $i += 2; continue }
        if ($c -eq '"') { $inStr = $false }
    } else {
        if     ($c -eq '"') { $inStr = $true }
        elseif ($c -eq '{') { $depth++ }
        elseif ($c -eq '}') { $depth--; if ($depth -eq 0) { break } }
    }
    $i++
}
if ($depth -ne 0) { throw "Bloque sin cerrar: las llaves no cuadran (revisa el ancla)" }

$block = $text.Substring($open, $i - $open + 1)

$header = @"
-- KyaUI: $Comment
local addonName, addonTable = ...
KyaUI = KyaUI or {}
$Var =
"@

$outPath = if ([System.IO.Path]::IsPathRooted($Out)) { $Out } else { Join-Path (Split-Path $PSScriptRoot -Parent) $Out }
[System.IO.File]::WriteAllText($outPath, "$header $block`n", (New-Object System.Text.UTF8Encoding $false))
Write-Host "OK -> $outPath ($([math]::Round((Get-Item $outPath).Length/1KB,1)) KB)"
