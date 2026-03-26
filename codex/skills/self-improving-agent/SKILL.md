---
name: self-improving-agent
description: "Codex adaptation of the ClawHub skill at https://clawhub.ai/pskoett/self-improving-agent. Use for every substantive prompt in this setup, especially when a command fails, the user corrects something, a recurring better pattern appears, or a missing capability should become part of the shared workflow. Review learnings before major work and promote broadly useful learnings into the central repo."
---

# Self-Improving Agent

Source reference:

- `https://clawhub.ai/pskoett/self-improving-agent`

This is the Codex-adapted installation of the original `self-improving-agent` workflow.

Use this skill as a mandatory companion for substantial work in this setup.

## Core Rule

When substantial work starts:

1. read the relevant learnings if the task is large, fragile, or similar to past issues
2. keep an eye out for failures, corrections, better recurring patterns, and missing capabilities
3. log them into the Codex learnings directory
4. promote shared learnings into the central workflow repo when they should affect all machines

Default learnings location:

- Windows: `%USERPROFILE%\.codex\.learnings\`
- Linux: `~/.codex/.learnings/`

Files:

- `LEARNINGS.md`
- `ERRORS.md`
- `FEATURE_REQUESTS.md`

## When To Log

Log to `ERRORS.md` when:

- a command or operation fails unexpectedly
- an external tool or MCP misbehaves
- a setup gotcha is likely to recur

Log to `LEARNINGS.md` when:

- the user corrects an incorrect conclusion
- knowledge was outdated or incomplete
- a better standard pattern became clear

Log to `FEATURE_REQUESTS.md` when:

- the user asks for a capability the setup does not yet have
- a repeated manual step should become a skill, script, or workflow rule

## Promotion Rule

Promote broadly useful learnings into:

- `codex/AGENTS.md`
- `codex/WORKFLOW.md`
- `codex/skills/kevin/`
- another shared skill if the learning is domain-specific
- installers or docs if the setup itself changed

If the shared baseline changes:

1. update `codex-portable-setup`
2. commit and push
3. run `scripts/sync-all.ps1`
4. verify Shadow, HomePC, and `htown`

## Codex Notes

The upstream skill includes OpenClaw-oriented hooks and references. Keep those bundled resources available, but in Codex the durable enforcement path is:

- workflow rules in `AGENTS.md` and `WORKFLOW.md`
- `kevin` requiring `self-improving-agent`
- installed learnings templates under `.codex/.learnings/`

## References

Read as needed:

- `references/hooks-setup.md`
- `references/openclaw-integration.md`
- `references/examples.md`
