$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceCodex = Join-Path $repoRoot "codex"
$localCodex = Join-Path $env:USERPROFILE ".codex"
$localSkills = Join-Path $localCodex "skills"
$linuxHosts = @("homepc", "htown")
$repoUrl = "https://github.com/zirkumflex567-sketch/codex-portable-setup.git"
$remoteRepo = "~/workspace/codex-portable-setup"

Write-Host "Refreshing shared baseline on local Shadow machine..."

New-Item -ItemType Directory -Force -Path $localCodex | Out-Null
New-Item -ItemType Directory -Force -Path $localSkills | Out-Null

Copy-Item -Force (Join-Path $sourceCodex "AGENTS.md") $localCodex
Copy-Item -Force (Join-Path $sourceCodex "WORKFLOW.md") $localCodex
Copy-Item -Force (Join-Path $sourceCodex "config.template.toml") (Join-Path $localCodex "config.template.toml")

Get-ChildItem (Join-Path $sourceCodex "skills") -Directory | ForEach-Object {
    $destination = Join-Path $localSkills $_.Name
    if (Test-Path $destination) {
        Remove-Item -Recurse -Force $destination
    }
    Copy-Item -Recurse -Force $_.FullName $destination
    Write-Host "Local skill refreshed: $($_.Name)"
}

Write-Host ""
Write-Host "Ensuring portable CLIs on Shadow..."
npm install -g ctx7 notebooklm-mcp

foreach ($targetHost in $linuxHosts) {
    Write-Host ""
    Write-Host "Refreshing $targetHost ..."

    $remoteCommand = "mkdir -p ~/workspace; if [ -d $remoteRepo/.git ]; then git -C $remoteRepo pull --ff-only || { rm -rf $remoteRepo; git clone $repoUrl $remoteRepo; }; else git clone $repoUrl $remoteRepo; fi; chmod +x $remoteRepo/scripts/install.sh; bash $remoteRepo/scripts/install.sh"
    ssh $targetHost $remoteCommand
}

Write-Host ""
Write-Host "Shared baseline sync completed for Shadow, HomePC, and htown."
Write-Host "Restart Codex on the updated machines if workflow/config changes should apply immediately."
