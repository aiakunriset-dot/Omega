# CONTEXT.md — L1 Pipeline Map (Projects/[PROJECT_NAME]/)

## One job

[One sentence: what this project produces from end to end]

## Pipeline stages

| Stage | Folder | Status check |
|-------|--------|--------------|
| 1. [nama] | `01_[nama]\` | `output\[file]` exists? |
| 2. [nama] | `02_[nama]\` | `output\[file]` exists? |
| 3. [nama] | `03_[nama]\` | `output\[file]` exists? |

## State detection

Scan each stage's `output\` folder in order:
- `01_.../output/` empty → Stage 1 active
- `01_.../output/` contains files → Stage 1 complete, check stage 2
- `02_.../output/` empty → Stage 2 active
- *(and so on)*

No database is needed. The filesystem is the state machine.

## Human gates

Required gate before proceeding to the next stage:
- After Stage [X]: `output\approved-[task]-YYYY-MM-DD.md` must exist
- After Stage [Y]: [approval condition]

## Shared resources

- `_shared\[file].md` — [description]
- `../../_shared\rules.md` — global rules (always in effect)
- `../../_shared\providers.md` — capability routing

## Capability required (default)

`general` — override in each stage CONTEXT.md if needed

---
*Pipeline created: YYYY-MM-DD*
