$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceCodex = Join-Path $repoRoot "codex"
$targetCodex = Join-Path $env:USERPROFILE ".codex"
$targetSkills = Join-Path $targetCodex "skills"

New-Item -ItemType Directory -Force -Path $targetCodex | Out-Null
New-Item -ItemType Directory -Force -Path $targetSkills | Out-Null

Copy-Item -Force (Join-Path $sourceCodex "AGENTS.md") $targetCodex
Copy-Item -Force (Join-Path $sourceCodex "WORKFLOW.md") $targetCodex

$configTarget = Join-Path $targetCodex "config.toml"
$configTemplate = Join-Path $sourceCodex "config.template.toml"
$configTemplateTarget = Join-Path $targetCodex "config.template.toml"

if (Test-Path $configTarget) {
    Copy-Item -Force $configTarget "$configTarget.pre-portable.bak"
}

Copy-Item -Force $configTemplate $configTemplateTarget
Copy-Item -Force $configTemplate $configTarget

Get-ChildItem (Join-Path $sourceCodex "skills") -Directory | ForEach-Object {
    $destination = Join-Path $targetSkills $_.Name
    if (Test-Path $destination) {
        Remove-Item -Recurse -Force $destination
    }
    Copy-Item -Recurse -Force $_.FullName $destination
    Write-Host "Installed skill $($_.Name)"
}

Write-Host ""
Write-Host "Installing portable CLIs..."
npm install -g ctx7 notebooklm-mcp

Write-Host ""
Write-Host "Portable Codex setup installed."
Write-Host "Review %USERPROFILE%\\.codex\\config.toml for machine-specific MCP paths."
Write-Host "Finally restart Codex."
