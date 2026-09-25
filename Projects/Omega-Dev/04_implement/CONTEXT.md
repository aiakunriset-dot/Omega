# 04_implement — Apply change to Omega core

## One job
Apply validated change to main Omega.

## Inputs
- Working: ../03_validate/output/validation-*.md
- Working: ../02_design/output/migrate.ps1
- Reference: ../../_shared/rules.md

## Process
1. Verify validation verdict is PASS.
2. Backup Omega (git commit).
3. Apply migration to main Omega.
4. Update _version.md + changelog.md.
5. Run walk test on main Omega.

## Outputs
- implementation-YYYY-MM-DD-{topic}.md → output/
- Updated _version.md + changelog.md

## Human check
Final review. Confirm before commit.

## Fail behavior
If walk test fails, run rollback.ps1.
