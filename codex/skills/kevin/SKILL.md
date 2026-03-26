---
name: kevin
description: "Universal meta-workflow skill for Kevin's Codex setup. Use for any substantive prompt in this environment, especially when the user explicitly says `KEVIN`, wants the shared 3-machine workflow, or wants Codex to follow the house process automatically. Orchestrates skill/plugin selection, self-improvement logging, workflow promotion, and cross-machine sync discipline."
---

# KEVIN

Use this as the universal overlay skill for this setup.

Do not use `kevin` as the only skill. Pair it with the best process, planning, domain, and verification skills for the task.

## Start Rule

At the start of substantial work:

1. Perform the normal `Skill + Plugin Check`.
2. Choose the smallest correct stack.
3. Announce the selected skills and tools briefly.
4. Follow the shared workflow from `references/shared-workflow.md`.

If the active shell is `powershell`, use PowerShell-native commands only.

## Self-Improvement Loop

Read `references/self-improvement.md` when you need the exact logging and promotion rules.

Use the self-improvement loop whenever one of these happens:

- a command or tool flow fails unexpectedly
- the user corrects a factual or workflow mistake
- you discover a better recurring pattern
- a capability is missing and should become part of the setup
- a new baseline rule should apply across machines

Default logging location in this setup:

- Windows: `%USERPROFILE%\.codex\.learnings\`
- Linux: `~/.codex/.learnings/`

Log to:

- `LEARNINGS.md` for corrections, knowledge gaps, best practices
- `ERRORS.md` for failures and reproducible gotchas
- `FEATURE_REQUESTS.md` for missing capabilities and setup ideas

## Promotion Rule

Promote a learning into the shared baseline when it is broadly useful, recurring, or machine-independent.

Promotion targets in the central repo:

- `codex/AGENTS.md` for workflow rules
- `codex/WORKFLOW.md` for the human-readable path
- `codex/skills/kevin/` when it belongs in the universal overlay
- another specific skill when the learning is domain-specific
- `README.md`, `docs/machines.md`, or installers when the baseline/setup changed

If the shared baseline changes:

1. update the central repo first
2. commit and push
3. run `scripts/sync-all.ps1` from Shadow
4. verify HomePC and `htown`

## Three-Machine Discipline

The central repo is the source of truth for the shared Codex baseline.

Current repo locations:

- Shadow: `C:\Users\Shadow\workspace\codex-portable-setup`
- Linux machines: `~/workspace/codex-portable-setup`

Do not fix the baseline on only one machine if the change should apply everywhere.

## Use Pattern

For normal tasks in this setup, prefer:

- `using-superpowers` + `kevin`

Then add the task-specific skill stack:

- implementation: `feature-dev`
- larger change: `writing-plans`
- browser validation: `playwright`
- docs/API accuracy: `find-docs`
- review: `requesting-code-review`

## End Rule

Before finishing:

1. verify the right tools/plugins were used when appropriate
2. decide whether the task created a reusable learning
3. update `.learnings/` if needed
4. if the baseline changed, update the central repo and sync the machines

## References

Read as needed:

- `references/shared-workflow.md`
- `references/self-improvement.md`
