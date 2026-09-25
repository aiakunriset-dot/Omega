# Global Rules — Never Violate

Applies to all AI, all projects, and all sessions.
Rules are added from real experience, not designed from scratch.

---

## R1 — Log Before Fix

Every error MUST be recorded in `_shared\errors.md` before it is fixed.

**Operating procedure:**

**Step 1:** Draft an entry using this format:
```
### Error: [short description]
- **Context:** what was being worked on
- **Symptom:** what was observed
- **Root cause:** why it happened (or "unknown — needs investigation")
- **Fix:** what resolved it (or "pending")
- **Date:** YYYY-MM-DD
```

**Step 2:** Show the draft to the human in chat/terminal.

**Step 3:** Human reviews and approves or edits.

**Step 4:** After approval, append to:
- `_shared\errors.md` (Omega level), OR
- `Projects\[nama]\_shared\errors.md` (project level)

**Step 5:** Only after logging may the fix proceed.

**Who writes:** AI drafts, human approves. No silent writes. No ad-hoc formats.

---

## R2 — Write Gate

No file in `04_production\output\` or `_shared\` may be modified
without an explicit statement from a human in the same session.

Not an assumption. Not an inference. An explicit statement.

---

## R3 — One Home Per Fact

Each fact, rule, or decision is stored in ONE place.
If needed elsewhere, create a link (reference), not a copy.

Violation sign: two files contain nearly identical sentences.

---

## R4 — Capability, Not Model

CONTEXT.md and SKILL.md never mention specific model names.
Use capability types from `_shared\providers.md`.
OmniRoute decides the concrete model.

Valid: `capability: reasoning-high`
Invalid: `model: claude-sonnet-4-6`

---

## R5 — Atomic Stage Output

Each stage writes to its own `output\`.
Stage N never writes to the `output\` of stage N+1 or N-1.

---

## R6 — Walk Test

Every agent entering Omega must be able to answer
"where am I and what should be done next"
by reading only the root `CLAUDE.md` plus a maximum of 2 more files.

If it cannot, fix the folder structure rather than adding a longer explanation.

---

## R7 — Human Gate Cannot Be Skipped

Stages with a `## Human check` section in `CONTEXT.md` cannot
continue to the next stage without an approval file in `output\`.

Format file approval: `output\approved-[task]-YYYY-MM-DD.md`
Contents: human statement + date + what was approved.

---

## R8 — Never Delete Without Log

No file may be deleted without recording the reason in `_shared\errors.md`.
If a file must be deleted, log it first, request human approval, then delete it.

---

## R9 — Fail Behavior Required

Every stage CONTEXT.md must have a `## Fail behavior` section.
Without it, AI must not execute that stage.

---

## R10 — Fail Behavior: Never Delete

Under no circumstances may Fail behavior delete files.
Failure → save partial output → log → stop → ask the human to decide.

---

## R11 — CONTEXT.md Self-Identification

Every CONTEXT.md must state its level on the first line.
Format: `# CONTEXT.md — L{n} {Level Name} ({location})`

Example:
```
# CONTEXT.md — L1 Pipeline Map (Projects/Quant-Lab/)
# CONTEXT.md — L2 Stage Contract (01_research/)
```

---

## R12 — Inheritance Hierarchy

Omega has two _shared/ layers:
1. `C:\Omega\_shared\` — global, applies to ALL projects
2. `C:\Omega\Projects\[nama]\_shared\` — project-specific

Resolution order: project-level specializes global for that project only.
Global rules are never fully overridden — a project may specialize but not negate them.

Valid example: global R1 = "log all errors". Project rule = "log errors with additional field X".
Invalid example: project rule = "skip error logging for this project".

---

*New rules: add them here and assign the next number. Do not duplicate them elsewhere.*
