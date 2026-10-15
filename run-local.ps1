$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

$env:CH_HOME = Join-Path $PSScriptRoot '.local/data'
$env:CH_DB = Join-Path $env:CH_HOME 'ch-relay.sqlite'
$env:CH_ADMIN_OPEN = '0'
New-Item -ItemType Directory -Path $env:CH_HOME -Force | Out-Null

$bunExecutable = Join-Path $PSScriptRoot '.runtime/bun-windows-x64/bun.exe'
& $bunExecutable src/cli.ts start --port 11510 --share-port 11514 --admin-port 0
exit $LASTEXITCODE
