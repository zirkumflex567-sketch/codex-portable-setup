# Self-Improvement

This setup adapts the useful parts of `self-improving-agent` for Codex.

## When To Log

Write an entry when:

- a command or tool fails in a reusable way
- the user corrects a wrong conclusion
- a better recurring workflow becomes clear
- a missing capability should become part of the shared setup

## Where To Log

Use the per-machine Codex home:

- `%USERPROFILE%\.codex\.learnings\` on Windows
- `~/.codex/.learnings/` on Linux

Files:

- `LEARNINGS.md`
- `ERRORS.md`
- `FEATURE_REQUESTS.md`

## What To Promote

Promote into the shared repo when the learning is:

- cross-project
- machine-independent
- likely to recur
- important enough that future sessions should inherit it automatically

Typical promotion targets:

- `codex/AGENTS.md`
- `codex/WORKFLOW.md`
- `codex/skills/kevin/`
- another shared skill
- installers or machine docs

## Minimal Entry Guidance

Learning entries should capture:

- what was wrong
- what is correct now
- the suggested durable fix

Error entries should capture:

- failing command or tool
- actual error text
- how to avoid or fix it

Feature request entries should capture:

- missing capability
- why it matters
- likely implementation path
