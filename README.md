# Codex Portable Setup

Portable export of the current Codex workflow, adapted skills, and plugin setup.

This repo is the central source of truth for the shared Codex baseline across:

- Shadow
- HomePC
- htown

## What This Repo Contains

- `codex/AGENTS.md`
  Persistent workflow policy enforced for new Codex sessions.
- `codex/WORKFLOW.md`
  Human-readable workflow guide with recommended skill stacks.
- `codex/config.template.toml`
  Sanitized Codex config template.
- `codex/templates/learnings/`
  Seed files for the shared self-improvement logs under `.codex/.learnings/`.
- `codex/skills/`
  Exported skills, including locally adapted Codex-compatible variants.
  This now includes `kevin`, the universal workflow overlay for this setup.
- `scripts/install.ps1`
  Helper script to copy this setup into a target Windows machine's `%USERPROFILE%\.codex`.
- `scripts/install.sh`
  Helper script to copy this setup into a target Linux machine's `~/.codex`.
- `scripts/sync-all.ps1`
  Orchestrates a baseline refresh across Shadow, HomePC, and `htown` from the Windows side.
- `docs/machines.md`
  Central machine matrix, roles, baseline, and allowed machine-specific differences.

## What Is Intentionally Not Included

- Local auth files
- API keys
- SQLite state
- session history
- machine-specific trust/project entries
- local-only MCP paths that are not portable

## Portable MCPs And Defaults

These MCPs and defaults are represented in `config.template.toml` because they are portable:

- `gpt-5.4` as the default model
- medium reasoning effort
- `playwright`
- `notebooklm`
- `notion`
- `linear`
- `rmcp_client`

These are intentionally left as manual post-setup steps because they are machine-local:

- `screenhand`
- `androidGameAutomation`
- local desktop/game/editor MCPs
- machine-specific project trust entries

## Setup On Another Windows PC

1. Install Codex and Node.js.
2. Clone this repo.
3. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

4. Restart Codex.

The PowerShell installer also refreshes:

- `%USERPROFILE%\.codex\AGENTS.md`
- `%USERPROFILE%\.codex\WORKFLOW.md`
- `%USERPROFILE%\.codex\skills\...`
- `%USERPROFILE%\.codex\config.template.toml`
- `%USERPROFILE%\.codex\config.toml` from the portable baseline
- `%USERPROFILE%\.codex\.learnings\...` seed files if they do not exist yet

If a target machine already has a `config.toml`, the installer creates a backup first and then writes the portable baseline so both machines start from the same workflow path.

It also installs the portable CLIs:

```powershell
npm install -g ctx7 notebooklm-mcp
```

## Setup On Linux / Headless Hosts Like `htown`

1. Install Codex and Node.js.
2. Clone this repo.
3. Run:

```bash
chmod +x ./scripts/install.sh
./scripts/install.sh
```

4. Restart Codex.

The Linux installer mirrors the same workflow files, skill folders, and config template into `~/.codex` and installs:

```bash
npm install -g --prefix ~/.local ctx7 notebooklm-mcp
```

Make sure `~/.local/bin` is on `PATH` for the target user.

Both installers also seed:

- `.codex/.learnings/LEARNINGS.md`
- `.codex/.learnings/ERRORS.md`
- `.codex/.learnings/FEATURE_REQUESTS.md`

without overwriting an existing local learning history.

## Goal

HomePC and secondary hosts like `htown` should follow the same path:

- same `AGENTS.md`
- same `WORKFLOW.md`
- same `KEVIN` skill
- same exported skills
- same portable MCP defaults
- same CLI helpers where portable
- same self-improvement seed files and promotion path

Machine-specific MCPs can still be added locally afterwards, but the baseline workflow should stay identical.

## Update Rule

When the shared workflow changes:

1. Update this repo
2. Commit and push it
3. Run the cross-machine sync script from Shadow:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-all.ps1
```

That keeps:

- Shadow aligned on workflow files and exported skills
- HomePC aligned via SSH
- `htown` aligned via SSH
- all three machines aligned on the `KEVIN` skill and learnings templates

The local Shadow sync intentionally preserves Shadow-specific config details while still refreshing the shared baseline.

## Notes

- NotebookLM still requires authentication on the target machine.
- Context7 can work via API key or login on the target machine.
- If a skill already exists on the target machine, this setup script overwrites it.
