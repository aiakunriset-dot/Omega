# 02_design — Design structural change

## One job
Design the change + migration plan.

## Inputs
- Working: ../01_research/output/evaluation-*.md
- Reference: ../../_shared/rules.md

## Process
1. Read approved evaluation.
2. Design the change.
3. Write migration script (if needed).
4. Write rollback script.
5. Define validation criteria.

## Outputs
- design-YYYY-MM-DD-{topic}.md → output/
- migrate.ps1 → output/
- rollback.ps1 → output/

## Human check
Review design + migration + rollback. Approve before validate.

## Fail behavior
If design is unsafe, return to 01 with specific question.
