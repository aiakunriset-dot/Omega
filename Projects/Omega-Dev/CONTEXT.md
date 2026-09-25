# Omega-Dev — Pipeline

## One job
Evolve Omega itself: research tools, design changes, validate, implement.

## Stages
| # | Folder | Purpose | Output |
|---|--------|---------|--------|
| 01 | 01_research/ | Evaluate tools, methodologies, versions | evaluation-*.md |
| 02 | 02_design/ | Design structural change + migration | design-*.md |
| 03 | 03_validate/ | Test change in sandbox | validation-*.md |
| 04 | 04_implement/ | Apply change to Omega core | implementation-*.md |

## Flow
01 → 02 → 03 → 04

If 03 fails: return to 02 with new design.
If 02 fails: return to 01 with refined question.

## Human check
Between every stage. Human approves before next stage.

## Shared (L3)
- _shared/notes.md — decision log
- _shared/tools.md — tool registry
- SOUL.md — project identity

## Final output
output/ — implemented change summary
