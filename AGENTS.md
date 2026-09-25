# C:\Omega\ — Agent Entry Point

You are at the root of Omega. This system works with any AI model.

## Quick Orientation

| I want to... | Go to |
|--------------|-------|
| Work on active project | `Projects\[name]\CLAUDE.md` |
| Create new project | Copy `_templates\` → `Projects\[name]\`, read `_shared\rules.md` |
| Check global rules | `_shared\rules.md` |
| Select model / provider | `_shared\providers.md` |
| Review past errors | `_shared\errors.md` |
| Review proven patterns | `_shared\patterns.md` |

## Active Projects

| Project | Folder | Find current stage |
|---------|--------|--------------------|
| Quant-Lab | `Projects\Quant-Lab\` | Scan each stage's output\ |

## Non-Negotiable Rules

1. Read the stage `CONTEXT.md` before doing anything
2. Write output ONLY to the active stage's `output\` folder
3. Nothing is deleted without logging to `_shared\errors.md` first
4. Changes to `_shared\` require human approval
5. No model names in CONTEXT.md or SKILL.md — use capability types only

## How to Check Project Status

Scan `output\` folder per stage. File exists → stage complete. Empty → this is the active stage.

---
*Omega v0.1 — Compatible: Claude Code, Gemini CLI, Codex, OpenCode, any MCP-capable agent*
