#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_CODEX="$REPO_ROOT/codex"
TARGET_CODEX="${HOME}/.codex"
TARGET_SKILLS="${TARGET_CODEX}/skills"

mkdir -p "$TARGET_CODEX"
mkdir -p "$TARGET_SKILLS"

cp "$SOURCE_CODEX/AGENTS.md" "$TARGET_CODEX/AGENTS.md"
cp "$SOURCE_CODEX/WORKFLOW.md" "$TARGET_CODEX/WORKFLOW.md"

if [[ -f "$TARGET_CODEX/config.toml" ]]; then
  cp "$TARGET_CODEX/config.toml" "$TARGET_CODEX/config.toml.pre-portable.bak"
fi

cp "$SOURCE_CODEX/config.template.toml" "$TARGET_CODEX/config.template.toml"
cp "$SOURCE_CODEX/config.template.toml" "$TARGET_CODEX/config.toml"

find "$SOURCE_CODEX/skills" -mindepth 1 -maxdepth 1 -type d | while read -r skill_dir; do
  skill_name="$(basename "$skill_dir")"
  destination="$TARGET_SKILLS/$skill_name"
  rm -rf "$destination"
  cp -R "$skill_dir" "$destination"
  echo "Installed skill $skill_name"
done

echo
echo "Installing portable CLIs..."
npm install -g ctx7 notebooklm-mcp

echo
echo "Portable Codex setup installed."
echo "Review ~/.codex/config.toml for machine-specific MCP paths."
echo "Finally restart Codex."
