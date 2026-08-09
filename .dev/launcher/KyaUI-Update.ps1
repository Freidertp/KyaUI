# KyaUI - actualizador + lanzador.
#
# Comprueba si hay una version nueva publicada en GitHub, la instala y arranca el
# Ascension Launcher. Pensado para ejecutarse desde KyaUI-Launcher.bat (doble click).
#
# Solo toca las carpetas de addons que vienen dentro del paquete. NUNCA toca WTF\
# (perfiles, keybinds, macros) ni los addons que el usuario haya puesto por su cuenta.
#
# Parametros utiles para probar:
#   -CheckOnly   solo informa de si hay version nueva, no descarga nada
#   -NoLaunch    actualiza pero no abre el juego
#   -Force       reinstala aunque la version publicada no sea mas nueva
#   -ZipPath     instala desde un zip que ya tienes en disco, sin pasar por GitHub
[CmdletBinding()]
param(
    [string]$ClientPath,
    [string]$Repo,
    [string]$ZipPath,
    [switch]$CheckOnly,
    [switch]$NoLaunch,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
# Invoke-WebRequest es mucho mas lento con la barra de progreso de PowerShell 5.1
$ProgressPreference = 'SilentlyContinue'

# Repo de GitHub del que se leen las releases. Se puede cambiar en kyaui-launcher.json
# ("repo": "usuario/KyaUI") o pasando -Repo.
$DEFAULT_REPO = 'Freidertp/KyaUI'

$ADDONS_REL = 'resources\ascension-live\Interface\AddOns'
$LAUNCHER_EXE = 'Ascension Launcher.exe'

function Write-Ok   { param($m) Write-Host $m -ForegroundColor Green }
function Write-Warn { param($m) Write-Host $m -ForegroundColor Yellow }
function Write-Bad  { param($m) Write-Host $m -ForegroundColor Red }

$configPath = Join-Path $PSScriptRoot 'kyaui-launcher.json'

function Get-Config {
    if (Test-Path $configPath) {
        try { return (Get-Content $configPath -Raw | ConvertFrom-Json) } catch { return $null }
    }
    return $null
}

function Save-Config {
    param([string]$Client, [string]$RepoName)
    try {
        $obj = [ordered]@{ clientPath = $Client; repo = $RepoName }
        ($obj | ConvertTo-Json) | Out-File -FilePath $configPath -Encoding utf8
    } catch {
        Write-Warn "No se pudo guardar $configPath (se volvera a detectar la ruta la proxima vez)."
    }
}

# Una carpeta es el cliente si dentro tiene la ruta de addons de Ascension
function Test-Client {
    param([string]$Path)
    if (-not $Path) { return $false }
    return (Test-Path (Join-Path $Path $ADDONS_REL))
}

function Find-Client {
    $cands = @()

    # 1) la propia carpeta del script y sus padres (por si el launcher vive dentro del cliente)
    $dir = $PSScriptRoot
    for ($i = 0; $i -lt 5; $i++) {
        if (-not $dir) { break }
        $cands += $dir
        $dir = Split-Path $dir -Parent
    }

    # 2) rutas de instalacion habituales
    $cands += (Join-Path $env:LOCALAPPDATA 'Programs\ascension-launcher')
    $cands += (Join-Path $env:LOCALAPPDATA 'ProjectAscension')
    $cands += (Join-Path $env:LOCALAPPDATA 'Ascension Launcher')
    if ($env:ProgramFiles)          { $cands += (Join-Path $env:ProgramFiles 'Ascension Launcher') }
    if (${env:ProgramFiles(x86)})   { $cands += (Join-Path ${env:ProgramFiles(x86)} 'Ascension Launcher') }

    # 3) entradas de desinstalacion en el registro
    $keys = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )
    try {
        $found = Get-ItemProperty $keys -ErrorAction SilentlyContinue |
                 Where-Object { $_.DisplayName -like '*scension*' -and $_.InstallLocation } |
                 ForEach-Object { $_.InstallLocation }
        if ($found) { $cands += $found }
    } catch { }

    # 4) barrido corto: raiz de cada unidad fija y las carpetas tipo Games / Program Files
    try {
        $drives = Get-PSDrive -PSProvider FileSystem -ErrorAction SilentlyContinue |
                  Where-Object { $_.Root -match '^[A-Za-z]:\\$' }
        foreach ($d in $drives) {
            $roots = @($d.Root, (Join-Path $d.Root 'Games'), (Join-Path $d.Root 'Program Files'))
            foreach ($r in $roots) {
                if (-not (Test-Path $r)) { continue }
                try {
                    $hits = Get-ChildItem $r -Directory -ErrorAction SilentlyContinue |
                            Where-Object { $_.Name -like '*scension*' } |
                            ForEach-Object { $_.FullName }
                    if ($hits) { $cands += $hits }
                } catch { }
            }
        }
    } catch { }

    foreach ($c in $cands) {
        if (Test-Client $c) { return $c }
    }
    return $null
}

function Request-Client {
    Write-Host ''
    Write-Host 'Selecciona la carpeta donde esta "Ascension Launcher.exe".'
    try {
        Add-Type -AssemblyName System.Windows.Forms
        $dlg = New-Object System.Windows.Forms.FolderBrowserDialog
        $dlg.Description = 'Carpeta de Ascension (la que contiene Ascension Launcher.exe)'
        $dlg.ShowNewFolderButton = $false
        if ($dlg.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            return $dlg.SelectedPath
        }
        return $null
    } catch {
        return (Read-Host 'Ruta de la carpeta de Ascension')
    }
}

# "v1.2" / "1.2.3-beta" -> [version]. Devuelve $null si no hay nada parseable.
function ConvertTo-Version {
    param([string]$Raw)
    if (-not $Raw) { return $null }
    $s = $Raw.Trim() -replace '^[vV]', ''
    $s = $s -replace '[^0-9\.].*$', ''
    $s = $s.Trim('.')
    if (-not $s) { return $null }
    if ($s -notmatch '\.') { $s = "$s.0" }
    try { return [version]$s } catch { return $null }
}

function Get-InstalledVersion {
    param([string]$Addons)
    $toc = Join-Path $Addons 'KyaUI\KyaUI.toc'
    if (-not (Test-Path $toc)) { return $null }
    $m = Select-String -Path $toc -Pattern '^##\s*Version:\s*(.+)$' | Select-Object -First 1
    if (-not $m) { return $null }
    return (ConvertTo-Version $m.Matches.Groups[1].Value)
}

# Ascension.exe oculta su ruta (Process.Path y Win32_Process vienen vacios), asi que no se
# puede saber por el proceso a que instalacion pertenece. Lo que si es fiable: si el exe DE
# ESTA instalacion esta bloqueado en escritura, es que se esta ejecutando desde aqui.
function Test-GameRunning {
    param([string]$Client)

    $exe = Join-Path $Client 'resources\ascension-live\Ascension.exe'

    if (Test-Path $exe) {
        try {
            $fs = [System.IO.File]::Open($exe, 'Open', 'ReadWrite', 'None')
            $fs.Close()
            return $false
        } catch {
            return $true
        }
    }

    # sin exe donde mirar, tirar de los nombres de proceso
    return ($null -ne (Get-Process -Name 'Ascension', 'Wow' -ErrorAction SilentlyContinue))
}

# ---------------------------------------------------------------- inicio

Write-Host ''
Write-Host '  KyaUI' -ForegroundColor Red -NoNewline
Write-Host ' - actualizador'
Write-Host '  ---------------------------------------------'

$cfg = Get-Config

$repo = $Repo
if (-not $repo) {
    if ($cfg -and $cfg.repo) { $repo = $cfg.repo } else { $repo = $DEFAULT_REPO }
}

$client = $ClientPath
if (-not (Test-Client $client)) {
    if ($cfg -and $cfg.clientPath) { $client = $cfg.clientPath }
}
if (-not (Test-Client $client)) {
    Write-Host '  Buscando la instalacion de Ascension...'
    $client = Find-Client
}
if (-not (Test-Client $client)) {
    Write-Warn '  No he encontrado Ascension automaticamente.'
    $client = Request-Client
}
if (-not (Test-Client $client)) {
    Write-Bad  '  Esa carpeta no parece la de Ascension.'
    Write-Host "  Deberia contener: $ADDONS_REL"
    exit 1
}

$addons = Join-Path $client $ADDONS_REL
Write-Host "  Cliente : $client"
Save-Config $client $repo

$installed = Get-InstalledVersion $addons
if ($installed) {
    Write-Host "  Instalada: v$installed"
} else {
    Write-Host '  Instalada: (KyaUI no esta instalado todavia)'
}

# KyaUI ya no empaqueta ElvUI: lo reparte el propio launcher de Ascension y se declara
# dependencia en el .toc. Sin el, KyaUI ni siquiera carga, asi que conviene avisar aqui
# en vez de dejar que el usuario lo descubra en la pantalla de personajes.
$elvui = Join-Path $addons 'ElvUI'
if (-not (Test-Path $elvui)) {
    Write-Host ''
    Write-Warn '  ElvUI no esta instalado. KyaUI es un plugin de ElvUI y no funciona sin el.'
    Write-Host '  Instalalo desde el Ascension Launcher -> pestana "Addons" -> ElvUI,'
    Write-Host '  y vuelve a ejecutar esto.'
    Write-Host ''
}

# ---------------------------------------------------------------- consultar release

$latest = $null
$asset = $null
$needsUpdate = $false

if ($ZipPath) {
    # instalacion desde un zip local: ni se consulta GitHub ni se compara nada
    if (-not (Test-Path $ZipPath)) {
        Write-Bad "  No existe el zip: $ZipPath"
        exit 1
    }
    Write-Host "  Origen  : $ZipPath"
    $needsUpdate = $true
} else {

Write-Host "  Consultando $repo ..."
try {
    # PowerShell 5.1 negocia TLS 1.0 por defecto y GitHub lo rechaza
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/releases/latest" `
                                 -Headers @{ 'User-Agent' = 'KyaUI-Updater' } `
                                 -UseBasicParsing
} catch {
    Write-Bad  '  No se pudo consultar GitHub.'
    Write-Host "  $($_.Exception.Message)"
    Write-Host '  Revisa tu conexion. Si el problema sigue, actualiza a mano desde:'
    Write-Host "  https://github.com/$repo/releases/latest"
    if (-not $NoLaunch -and -not $CheckOnly) {
        Write-Host ''
        Write-Host '  Abriendo el juego con la version que ya tienes...'
        $exe = Join-Path $client $LAUNCHER_EXE
        if (Test-Path $exe) { Start-Process $exe }
    }
    exit 1
}

$latest = ConvertTo-Version $release.tag_name
if (-not $latest) {
    Write-Bad "  El tag de la release ('$($release.tag_name)') no tiene un formato de version valido."
    exit 1
}

$asset = $release.assets | Where-Object { $_.name -like '*.zip' } | Select-Object -First 1
if (-not $asset) {
    Write-Bad '  La release no trae ningun .zip adjunto.'
    exit 1
}

Write-Host "  Publicada: v$latest"

$needsUpdate = $Force -or (-not $installed) -or ($latest -gt $installed)
if (-not $needsUpdate) {
    Write-Ok '  Ya tienes la ultima version.'
} elseif ($CheckOnly) {
    Write-Warn "  Hay version nueva: v$latest"
}

}   # fin del bloque "consultar release"

# ---------------------------------------------------------------- actualizar

if ($needsUpdate -and -not $CheckOnly) {

    if (Test-GameRunning $client) {
        Write-Bad  '  El juego esta abierto. Cierralo por completo y vuelve a ejecutar esto.'
        Write-Host '  (WoW reescribe WTF\ al salir y tiene los addons en uso)'
        exit 1
    }

    Write-Host ''

    $work = Join-Path $env:TEMP ("KyaUI-update-" + [System.Guid]::NewGuid().ToString('N').Substring(0, 8))
    New-Item -ItemType Directory -Force -Path $work | Out-Null
    $zip = Join-Path $work 'package.zip'
    $extract = Join-Path $work 'extract'

    try {
        if ($ZipPath) {
            Write-Host '  Instalando desde el zip local...'
            Copy-Item -LiteralPath $ZipPath -Destination $zip -Force
        } else {
            Write-Host "  Descargando v$latest ($([math]::Round($asset.size / 1MB, 1)) MB)..."
            Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zip -UseBasicParsing `
                              -Headers @{ 'User-Agent' = 'KyaUI-Updater' }
        }
        Expand-Archive -Path $zip -DestinationPath $extract -Force

        # Los directorios de primer nivel del zip SON el paquete: solo se tocan esos
        $pkgDirs = Get-ChildItem $extract -Directory
        if (-not $pkgDirs) { throw 'El zip no contiene ninguna carpeta de addon.' }

        $stamp  = Get-Date -Format 'yyyyMMdd-HHmmss'
        # El backup va FUERA de AddOns para que el juego no lo mire siquiera
        $backup = Join-Path $client "KyaUI-backups\$stamp"
        New-Item -ItemType Directory -Force -Path $backup | Out-Null

        $copied = 0
        $skipped = @()

        foreach ($d in $pkgDirs) {
            $target = Join-Path $addons $d.Name

            if (Test-Path $target) {
                # Proteccion: si es un junction/symlink (setup de desarrollo), no tocarlo.
                # Borrarlo o moverlo podria arrastrarse el contenido real del otro lado.
                $item = Get-Item $target -Force
                if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                    $skipped += $d.Name
                    continue
                }
                Move-Item -LiteralPath $target -Destination (Join-Path $backup $d.Name) -Force
            }

            Copy-Item -LiteralPath $d.FullName -Destination $addons -Recurse -Force
            $copied++
        }

        # Los textos sueltos del zip (INSTALL.txt, README.md, el propio launcher) a la raiz
        Get-ChildItem $extract -File | ForEach-Object {
            Copy-Item -LiteralPath $_.FullName -Destination $client -Force -ErrorAction SilentlyContinue
        }

        # con -ZipPath no hay tag de release: la version sale del propio paquete
        if (-not $latest) { $latest = Get-InstalledVersion $extract }
        Write-Ok  "  Actualizado a v$latest ($copied carpetas)."
        Write-Host "  Copia de seguridad: $backup"

        if ($skipped.Count -gt 0) {
            Write-Warn "  Omitidas por ser enlaces (junction): $($skipped -join ', ')"
        }

        # dejar solo las 2 copias de seguridad mas recientes
        $backupRoot = Join-Path $client 'KyaUI-backups'
        Get-ChildItem $backupRoot -Directory -ErrorAction SilentlyContinue |
            Sort-Object Name -Descending |
            Select-Object -Skip 2 |
            ForEach-Object { Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }

    } catch {
        Write-Bad  '  Fallo la actualizacion.'
        Write-Host "  $($_.Exception.Message)"
        Write-Host '  No se ha dejado nada a medias: si algo se movio, esta en KyaUI-backups\.'
        exit 1
    } finally {
        Remove-Item $work -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# ---------------------------------------------------------------- lanzar

if (-not $NoLaunch -and -not $CheckOnly) {
    $exe = Join-Path $client $LAUNCHER_EXE
    if (Test-Path $exe) {
        Write-Host ''
        Write-Host '  Abriendo Ascension...'
        Start-Process $exe
    } else {
        Write-Warn "  No encuentro $LAUNCHER_EXE en $client (abre el juego como siempre)."
    }
}

exit 0
