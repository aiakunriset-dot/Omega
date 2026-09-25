# CONTEXT.md — L2 Stage Contract (0N_[stage-name]/)

## One job

[One sentence: what this stage produces. No more than one primary output.]

## Inputs

**Working** (changes each run):
- `../[path]/[file]` — [description]

**Reference** (stable across runs):
- `../_shared/[file]` — [description]
- `../../_shared/rules.md` — global rules

## Process

1. [First step — specific]
2. [Second step — specific]
3. [Third step — specific]
4. Write the result to `output/[output-name].md`

## Outputs

| File | Description | Format |
|------|-----------|--------|
| `output/[name].md` | [contents] | Markdown |

## Capability required

`[capability-type]` — see `../../_shared/providers.md`

## Human check

Before proceeding to the next stage:
1. [What the human must verify]
2. [Pass criteria]
3. If approved, create `output/approved-[task]-YYYY-MM-DD.md`

## Fail behavior

- If [failure condition 1]:
  → [specific action — do not delete files]
  → Stop. The human decides whether to retry.
- If [failure condition 2]:
  → Save partial output to `output/fail-YYYY-MM-DD.md`
  → Log to `../../_shared/errors.md`
  → Stop. Do not proceed to the next stage.
- **Under no circumstances may files be deleted.**

---
*Stage contract created: YYYY-MM-DD*
