# Projects\Quant-Lab\ — Entry Point

You are in Quant-Lab. Read `SOUL.md` and `CONTEXT.md` before doing anything.

## Project Entry Steps

1. Read `SOUL.md` — AI identity and project constraints
2. Read `CONTEXT.md` — pipeline map and current state
3. Scan `output\` for each stage to determine the active stage
4. Go to the active stage and read its `CONTEXT.md`

## Project Description

Quant-Lab is a pipeline for research, development, audit, and production
of quantitative trading strategies. Each run produces one strategy that
has been validated and is ready for use.

## Pipeline

| Stage | Folder | Complete when |
|-------|--------|--------------|
| 1. Research | `01_research\` | `output\research-brief.md` ada |
| 2. Development | `02_development\` | `output\strategy.py` ada |
| 3. Audit | `03_audit\` | `output\audit-report.md` berisi `PASS` |
| 4. Production | `04_production\` | `output\deployed.md` ada |

## Human Gates (Mandatory)

- **After Stage 1:** Human approves `research-brief.md` before code is written
- **After Stage 3:** Human approves `audit-report.md` before production

## Shared Resources for This Project

- `_shared\strategies.md` — strategy catalog (status per strategy)
- `_shared\conventions.md` — data, backtest, and code conventions
- `../../_shared\rules.md` — global rules (always in effect)
- `../../_shared\providers.md` — capability routing

---
*Quant-Lab v1.0 · Created: 2026-09-23 · Omega v1.0*
