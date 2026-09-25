# CONTEXT.md — L1 Pipeline Map (Projects/Quant-Lab/)

## One job

Produce one quantitative trading strategy that has been statistically
validated and packaged for monitoring and deployment.

## Pipeline stages

| # | Stage | Folder | Expected output |
|---|-------|--------|----------------------|
| 1 | Research | `01_research\` | `output\research-brief.md` |
| 2 | Development | `02_development\` | `output\strategy.py` |
| 3 | Audit | `03_audit\` | `output\audit-report.md` (must contain `PASS`) |
| 4 | Production | `04_production\` | `output\deployed.md` |

## State detection

Scan each stage's `output\` folder in order:
```
01_research/output/    empty → Stage 1 active (start here)
01_research/output/    contains files → Stage 1 complete, check stage 2
02_development/output/ empty → Stage 2 active
02_development/output/ contains files → Stage 2 complete, check stage 3
03_audit/output/       empty → Stage 3 active
03_audit/output/       contains audit-report.md with PASS → Stage 3 complete
04_production/output/  empty → Stage 4 active
04_production/output/  contains deployed.md → Pipeline complete
```

No database is needed. The filesystem is the state machine.

## Human gates (mandatory)

| Gate | Trigger | Required file |
|------|---------|----------------------|
| Research → Development | Human approves research-brief.md | `01_research/output/approved-research-YYYY-MM-DD.md` |
| Audit → Production | Human approves audit-report.md | `03_audit/output/approved-audit-YYYY-MM-DD.md` |

## Shared resources

- `_shared\strategies.md` — strategy catalog and status
- `_shared\conventions.md` — data, code, and backtest conventions
- `../../_shared\rules.md` — global rules (always in effect)
- `../../_shared\providers.md` — capability routing

## Capability defaults per stage

| Stage | Capability |
|-------|------------|
| 01_research | `research-long` |
| 02_development | `coding-fast` |
| 03_audit | `math-stats` |
| 04_production | `reasoning-high` |
