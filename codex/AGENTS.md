# Codex Workflow Policy

These rules define the default workflow for every new user prompt in this environment.

## Core Rule

Before taking any substantive action, always perform a `Skill + Plugin Check`.

That means:
- Identify whether any installed skill applies, even if the fit is only partial.
- Prefer process skills first, then domain or implementation skills.
- Check whether an installed MCP/plugin would improve accuracy or execution.
- Announce the chosen skills/plugins briefly before doing the work.

Do not skip this check just because the task looks simple.

## Default Process Skill

For normal coding and research work, default to:
- `using-superpowers`

If another process skill is clearly more appropriate, use it too, but `using-superpowers` is the baseline workflow governor.

## Skill Selection Order

Select skills in this order:
1. Process skill
2. Planning/execution skill
3. Domain skill
4. Review/verification skill

Preferred process/planning stack:
- Small to medium feature work: `using-superpowers` + `feature-dev`
- Larger feature or multi-step work: `using-superpowers` + `writing-plans`
- Structured execution from a plan: `subagent-driven-development` or `executing-plans`
- Review checkpoints: `requesting-code-review`
- Final wrap-up: `finishing-a-development-branch`
- TDD-focused implementation: `test-driven-development`
- Isolated workspace setup when appropriate: `using-git-worktrees`

## Documentation and Research

For external libraries, frameworks, APIs, SDKs, CLIs, configs, or version-sensitive questions, use:
- `find-docs` first
- `context7-cli` when direct Context7 CLI usage is useful

For user-owned notebook knowledge and source-grounded answers from NotebookLM, use:
- `notebooklm`
- Prefer the NotebookLM MCP server when available

## Frontend and UI

For frontend or UI tasks, consider this stack:
- `using-superpowers`
- `feature-dev`
- `frontend-design` for strong visual implementation
- `web-design-guidelines` for review/audit work
- `ui-ux-pro-max` for structured UX/UI quality guidance

## Browser / Desktop / Device Plugins

When execution requires real tools, prefer installed plugins over ad-hoc alternatives:
- `playwright` for browser flows, DOM interaction, snapshots, screenshots
- `screenhand` for desktop automation and native UI control
- `androidGameAutomation` for Android device/game workflows
- `notebooklm` MCP server for NotebookLM operations

If a plugin is clearly the right tool, use it instead of faking the work with text-only reasoning.

## Announcement Requirement

At the start of substantial tasks, explicitly say which skills/plugins are being used and why.

Example format:
- `Using using-superpowers + feature-dev for structured implementation.`
- `Using find-docs for current external documentation and Playwright for browser validation.`

## Verification Requirement

Before implementation:
- Confirm the selected skill stack matches the task.
- If a more suitable installed skill exists, use it.

Before final response:
- Confirm whether plugins/tools were used where appropriate.
- Mention any important skill or plugin not used and why, if that omission matters.

## Installed Skills To Consider

Always consider these installed skills during the Skill + Plugin Check:
- `using-superpowers`
- `feature-dev`
- `writing-plans`
- `subagent-driven-development`
- `executing-plans`
- `requesting-code-review`
- `finishing-a-development-branch`
- `test-driven-development`
- `using-git-worktrees`
- `frontend-design`
- `web-design-guidelines`
- `ui-ux-pro-max`
- `find-docs`
- `context7-cli`
- `notebooklm`
- `feature-dev`

Also consider built-in/local skills already present in Codex:
- `playwright`
- `playwright-interactive`
- `screenshot`
- `doc`
- `pdf`
- `spreadsheet`
- `develop-web-game`
- `disney-mirror-training-loop`
- `android-game-automation`
- `lexware-quote-from-note`
- `sora`

## Operating Principle

The default behavior for this environment is not "answer first, think about skills later".

The default behavior is:
1. Check applicable skills
2. Check relevant plugins/tools
3. Announce selected workflow
4. Execute with that workflow
5. Verify that the workflow was actually followed
