# 03_validate — Test change in sandbox

## One job
Apply change to sandbox copy, run walk test.

## Inputs
- Working: ../02_design/output/design-*.md
- Working: ../02_design/output/migrate.ps1
- Reference: ../../_shared/rules.md

## Process
1. Copy Omega to sandbox folder.
2. Apply migration to sandbox.
3. Run walk test on sandbox.
4. Compare before/after.
5. Verify rollback works.

## Outputs
- validation-YYYY-MM-DD-{topic}.md → output/
- Format: Applied / Walk test / Diff summary / Rollback status / Verdict

## Human check
Review validation. Approve before implement.

## Fail behavior
If validation fails, return to 02 with specific failure.
