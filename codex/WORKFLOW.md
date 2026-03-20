# Codex Workflow

This file explains the intended default operating workflow for this setup.

## Core Behavior

For every new prompt:

1. Perform a `Skill + Plugin Check`
2. Choose the smallest correct skill stack
3. Prefer process skills first
4. Prefer real plugins/tools when they materially improve execution
5. Briefly announce the selected workflow before doing substantial work

This is the default behavior, not an optional extra.

## Default Process Skill

Use:

- `using-superpowers`

as the baseline process governor for normal coding and research tasks.

## Recommended Skill Stacks

### Small to Medium Feature Work

- `using-superpowers`
- `feature-dev`

Use this for normal implementation work where codebase discovery, design, implementation, testing, and review are all needed.

### Larger Feature or Multi-Step Change

- `using-superpowers`
- `writing-plans`

Then execute with one of:

- `subagent-driven-development`
- `executing-plans`

Add as needed:

- `requesting-code-review`
- `finishing-a-development-branch`
- `test-driven-development`
- `using-git-worktrees`

### External Documentation / Version-Sensitive Work

- `find-docs`
- `context7-cli`

Use these whenever accuracy depends on current external library or API documentation.

### NotebookLM / Private Knowledge

- `notebooklm`

Prefer the NotebookLM MCP server over the raw skill when the server is available.

### Frontend / UI Work

- `using-superpowers`
- `feature-dev`
- `frontend-design`
- `ui-ux-pro-max`

For audits or reviews:

- `web-design-guidelines`

## Preferred Plugins / MCPs

Use these when execution benefits from real tooling:

- `playwright` for browser automation and DOM validation
- `screenhand` for desktop/native UI automation
- `androidGameAutomation` for Android workflows
- `notebooklm` MCP server for NotebookLM operations

Do not fake these workflows with text-only reasoning when the plugin is clearly the right tool.

## Announcement Pattern

Before substantial work, say which skills/plugins are being used.

Examples:

- `Using using-superpowers + feature-dev for structured feature work.`
- `Using find-docs for current external documentation and Playwright for browser verification.`
- `Using notebooklm MCP for source-grounded answers from your notebook library.`

## Verification Pattern

Before implementation:

- Confirm the selected skill stack fits the task.
- If a better installed skill exists, use it instead.

Before the final response:

- Confirm whether the appropriate plugin/tool was used.
- Mention important omissions if they materially affected the result.

## High-Level Decision Tree

### Coding Task

- Start with `using-superpowers`
- If implementation-focused: add `feature-dev`
- If large or ambiguous: add `writing-plans`
- If plan exists: use `subagent-driven-development` or `executing-plans`

### External Tech Question

- Use `find-docs`
- Use `context7-cli` if direct Context7 CLI resolution/querying is useful

### NotebookLM Question

- Use `notebooklm`
- Prefer NotebookLM MCP if available

### UI / Frontend

- Use `using-superpowers`
- Add `feature-dev`
- Add `frontend-design` or `ui-ux-pro-max`
- Use `web-design-guidelines` for audits

## Exported Skills In This Setup

- `context7-cli`
- `executing-plans`
- `feature-dev`
- `find-docs`
- `finishing-a-development-branch`
- `frontend-design`
- `notebooklm`
- `requesting-code-review`
- `subagent-driven-development`
- `test-driven-development`
- `ui-ux-pro-max`
- `using-git-worktrees`
- `using-superpowers`
- `web-design-guidelines`
- `writing-plans`

## Goal

The point of this setup is not to "load every skill every time".

The point is to force a disciplined workflow:

1. Check skills
2. Check plugins
3. Choose deliberately
4. Execute with the chosen workflow
5. Verify that the workflow was followed
