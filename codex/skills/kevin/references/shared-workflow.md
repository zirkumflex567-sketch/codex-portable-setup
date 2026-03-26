# Shared Workflow

This setup follows one common path across Shadow, HomePC, and `htown`.

## Core Pattern

1. Run a `Skill + Plugin Check`
2. Pick the smallest correct stack
3. Announce the selected workflow
4. Execute with the right tools
5. Verify the workflow was actually followed

## Baseline Pairing

For substantial work in this environment, treat this as the default pair:

- `using-superpowers`
- `kevin`

Then add task-specific skills.

## Shell Rule

If the active shell is `powershell`:

- use PowerShell-native syntax
- do not use Bash chaining like `&&`
- prefer separate commands or `;`
- treat display mojibake separately from actual syntax failures

## Baseline Change Rule

If a change should apply to all three machines:

1. update `codex-portable-setup`
2. commit and push
3. run `scripts/sync-all.ps1`
4. verify the remote machines
