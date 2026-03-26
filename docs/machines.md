# Shared Machine Baseline

This document is the central reference for how the Codex baseline should look across the three machines we actively use.

## Source Of Truth

- Repo: `codex-portable-setup`
- Workflow policy: `codex/AGENTS.md`
- Human-readable workflow: `codex/WORKFLOW.md`
- Portable baseline config: `codex/config.template.toml`
- Shared skill export: `codex/skills/`

If a workflow rule changes, this repo must be updated first.

## Shared Baseline Across All Machines

The following should be the same everywhere, regardless of operating system:

- same `AGENTS.md`
- same `WORKFLOW.md`
- same exported skills
- same portable MCP defaults where platform-independent
- same default model baseline
- same CLI helpers where portable

Current shared baseline:

- `gpt-5.4`
- medium reasoning effort
- `rmcp_client = true`
- `using-superpowers` + `kevin` as the normal workflow pair
- portable MCPs:
  - `playwright`
  - `notebooklm`
  - `notion`
  - `linear`
- portable CLIs:
  - `ctx7`
  - `notebooklm-mcp`
- shared learnings templates under `.codex/.learnings/`

## Workflow Rules That Matter Everywhere

- Every substantial task starts with a `Skill + Plugin Check`.
- `using-superpowers` + `kevin` is the default workflow pair.
- Prefer real tools and MCPs where they improve accuracy.
- On Windows PowerShell, use PowerShell-native syntax and never assume Bash separators like `&&`.
- Important reusable failures/corrections should be logged in `.codex/.learnings/` and promoted into the repo when they belong to the shared baseline.

## Machine Matrix

### Shadow

- Hostname: `SHADOW-H34SQUKM`
- OS: Windows
- Role: primary interactive workstation and current source machine for workflow updates
- Install path: `C:\Users\Shadow\.codex`
- Sync behavior:
  - refresh `AGENTS.md`, `WORKFLOW.md`, exported skills, and `config.template.toml`
  - preserve Shadow-specific local config details where needed

### HomePC

- SSH alias: `homepc`
- Observed host output:
  - user: `kevin`
  - hostname: `kevin`
  - OS: Linux via WSL2
- Install path: `~/.codex`
- Sync behavior:
  - pull latest workflow repo
  - run `scripts/install.sh`

### htown

- SSH alias: `htown`
- Observed host output:
  - user: `kevin`
  - hostname: `localhost`
  - OS: Linux
- Install path: `~/.codex`
- Sync behavior:
  - pull latest workflow repo
  - run `scripts/install.sh`

## Allowed Differences

Allowed machine-specific differences:

- operating system specifics
- local-only MCP servers
- local editor/game/dev tooling integrations
- machine-specific trust entries
- NotebookLM auth/session state
- local path conventions

These differences should be documented, but they must not change the shared workflow baseline.

## Update Procedure

When we change the shared workflow:

1. Update this repo
2. Commit and push
3. Run `scripts/sync-all.ps1` from Shadow
4. Restart Codex on machines that were updated

## Why Shadow Is The Orchestrator

Right now Shadow is the practical control point because:

- it has the central repo clone
- it can SSH to `homepc` and `htown`
- it is the machine from which we already maintain the shared Codex baseline

If that changes later, we can add a Linux-side orchestrator script as well.
