# Codex Portable Setup

Portable export of the current Codex workflow, adapted skills, and plugin setup.

## What This Repo Contains

- `codex/AGENTS.md`
  Persistent workflow policy enforced for new Codex sessions.
- `codex/WORKFLOW.md`
  Human-readable workflow guide with recommended skill stacks.
- `codex/config.template.toml`
  Sanitized Codex config template.
- `codex/skills/`
  Exported skills, including locally adapted Codex-compatible variants.
- `scripts/install.ps1`
  Helper script to copy this setup into a target Windows machine's `%USERPROFILE%\.codex`.

## What Is Intentionally Not Included

- Local auth files
- API keys
- SQLite state
- session history
- machine-specific trust/project entries
- local-only MCP paths that are not portable

## Portable MCPs

These MCPs are represented in `config.template.toml` because they are portable:

- `playwright`
- `notebooklm`

These are intentionally left as manual post-setup steps because they are machine-local:

- `screenhand`
- `androidGameAutomation`

## Setup On Another PC

1. Install Codex and Node.js.
2. Clone this repo.
3. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

4. Review `%USERPROFILE%\.codex\config.toml` and add machine-specific MCP servers if needed.
5. Install portable CLIs:

```powershell
npm install -g ctx7 notebooklm-mcp
```

6. Restart Codex.

## Notes

- NotebookLM still requires authentication on the target machine.
- Context7 can work via API key or login on the target machine.
- If a skill already exists on the target machine, this setup script overwrites it.
