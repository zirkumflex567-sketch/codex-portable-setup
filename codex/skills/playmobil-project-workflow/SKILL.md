---
name: playmobil-project-workflow
description: "Use when working in the `playmobil-privatverkauf` repo or when the user asks for Playmobil catalog, figure-identification, GitHub sync, or ongoing documentation updates. Enforces the project-specific workflow: read current handoff/docs first, keep development logs current, update figure analysis consistently, validate the app, and keep git/GitHub in sync after meaningful milestones."
---

# Playmobil Project Workflow

Use this skill for any substantial work in `C:\Users\Shadow\workspace\playmobil-privatverkauf`.

## Quick Start

At the start of work:

1. Read these files first:
   - `C:\Users\Shadow\workspace\playmobil-privatverkauf\README.md`
   - `C:\Users\Shadow\workspace\playmobil-privatverkauf\HANDOFF.md`
   - `C:\Users\Shadow\workspace\playmobil-privatverkauf\docs\development-log.md`
2. If the task is about figures, also read:
   - `C:\Users\Shadow\workspace\playmobil-privatverkauf\src\data\figures.ts`
   - `C:\Users\Shadow\workspace\playmobil-privatverkauf\docs\table-analysis-overview.md`
   - `C:\Users\Shadow\workspace\playmobil-privatverkauf\docs\table-1-individual-analysis.md`
3. Check git state before editing:
   - `git -C C:\Users\Shadow\workspace\playmobil-privatverkauf status --short --branch`
   - `git -C C:\Users\Shadow\workspace\playmobil-privatverkauf remote -v`

## Core Workflow

### 1. Build Context Before Editing

- Use the project docs as the source of truth for current status.
- Do not rely on stale assumptions from earlier sessions.
- If the task touches UI or figures, inspect the currently imported images and current data structure before changing code.

### 2. Keep Analysis and App Data In Sync

If you update figure identification:

- update `src/data/figures.ts` for the live app data
- update `docs/table-1-individual-analysis.md` for the broader reasoning and uncertainty
- add direct source links whenever a comparison is strong enough to cite
- mark uncertainty honestly; use theme-world or figure type instead of inventing exact set IDs

### 3. Keep Project Documentation Current

After each meaningful milestone, append a dated entry to:

- `C:\Users\Shadow\workspace\playmobil-privatverkauf\docs\development-log.md`

Update `HANDOFF.md` when the session materially changes:

- current project status
- important files
- newly imported assets
- next sensible steps

Update `README.md` when the workflow, repo structure, or startup instructions change.

### 4. Validate Before Closing Work

Minimum validation:

- run `npm run build`

If UI behavior changed, also validate in-browser, preferably with Playwright:

- open the figures view
- verify the new images or metadata appear
- verify the relevant click flow still works

### 5. Git and GitHub Hygiene

For meaningful completed milestones:

1. Review `git status`
2. Stage only relevant files
3. Commit with a clear non-interactive message
4. If a GitHub remote exists, push the current branch

Do not rewrite history, force-push, or amend unless the user explicitly asks.

## Standard Milestone Checklist

Use this whenever you finish a chunk of work:

1. Code/data updated
2. Figure docs updated if identification changed
3. `docs/development-log.md` updated
4. `HANDOFF.md` updated if needed
5. `npm run build` passed
6. Browser/UI check done if relevant
7. Git status reviewed
8. Commit + push done if the user asked for GitHub sync or the repo workflow expects it

## References

For quick project orientation, read:

- `references/project-map.md`
