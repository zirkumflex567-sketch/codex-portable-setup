$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceCodex = Join-Path $repoRoot "codex"
$targetCodex = Join-Path $env:USERPROFILE ".codex"
$targetSkills = Join-Path $targetCodex "skills"

New-Item -ItemType Directory -Force -Path $targetCodex | Out-Null
New-Item -ItemType Directory -Force -Path $targetSkills | Out-Null

Copy-Item -Force (Join-Path $sourceCodex "AGENTS.md") $targetCodex
Copy-Item -Force (Join-Path $sourceCodex "WORKFLOW.md") $targetCodex

if (-not (Test-Path (Join-Path $targetCodex "config.toml"))) {
    Copy-Item -Force (Join-Path $sourceCodex "config.template.toml") (Join-Path $targetCodex "config.toml")
} else {
    Copy-Item -Force (Join-Path $sourceCodex "config.template.toml") (Join-Path $targetCodex "config.template.toml")
}

Get-ChildItem (Join-Path $sourceCodex "skills") -Directory | ForEach-Object {
    $destination = Join-Path $targetSkills $_.Name
    if (Test-Path $destination) {
        Remove-Item -Recurse -Force $destination
    }
    Copy-Item -Recurse -Force $_.FullName $destination
    Write-Host "Installed skill $($_.Name)"
}

Write-Host ""
Write-Host "Portable Codex setup installed."
Write-Host "Review %USERPROFILE%\\.codex\\config.toml for machine-specific MCP paths."
Write-Host "Then install portable CLIs if needed:"
Write-Host "  npm install -g ctx7 notebooklm-mcp"
Write-Host "Finally restart Codex."
