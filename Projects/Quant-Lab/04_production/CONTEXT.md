# CONTEXT.md — L2 Stage Contract (04_production/)

## One job

Package the audited strategy into one deployment-ready package:
final code, operational documentation, a monitoring plan, and rollback procedure —
complete enough for anyone to run without additional explanation.

## Prerequisite check (HARD GATE — no exceptions)

Before starting, verify that all three files EXIST:
- `../03_audit/output/audit-report.md` contains `**PASS**` ✓
- `../03_audit/output/approved-audit-YYYY-MM-DD.md` exists ✓
- `../02_development/output/[strategy-name].py` exists ✓

If any is missing or audit-report does not contain PASS:
→ Stop. Return to stage 03_audit. No exceptions.

## Inputs

**Working** (per run):
- `../03_audit/output/audit-report.md` — audit result (must be PASS)
- `../03_audit/output/approved-audit-YYYY-MM-DD.md` — human approval
- `../02_development/output/[strategy-name].py` — final code
- `../02_development/output/test_[strategy-name].py` — test suite

**Reference** (stable):
- `../01_research/output/research-brief.md` — for documentation
- `../_shared/conventions.md` — library versions, standards
- `../../_shared/rules.md` — global rules

## Process

1. Verify ALL prerequisites — stop if any are missing
2. Create the `output/package/` folder
3. Copy final code: `output/package/[strategy-name].py`
4. Copy the test suite: `output/package/test_[strategy-name].py`
5. Write `output/package/README.md` — how to run the strategy
6. Write `output/package/requirements.txt` — exact versions from conventions
7. Write `output/monitoring.md` — what to monitor and alert thresholds
8. Write `output/rollback.md` — procedure if the strategy underperforms live
9. Write `output/deployed.md` — deployment summary (does not mean it is live)

## Output format: monitoring.md

```markdown
# Monitoring Plan: [strategy-name]
Date: YYYY-MM-DD

## Metrics to Monitor (Daily)

| Metric | Alert Threshold | Action |
|--------|-----------------|--------|
| Daily PnL | < -3% | Review immediately |
| Rolling 30d Sharpe | < 0.5 | Human review |
| Max Drawdown (live) | > 15% | Pause strategy |
| Trade frequency | < 50% expected | Check signal logic |

## Weekly Review Checklist
- [ ] Compare live metrics vs backtest expectations
- [ ] Check for regime change signals
- [ ] Verify data feed quality

## Monthly Review
- Recalculate rolling metrics
- Compare to audit-report.md benchmarks
- Decision: continue / adjust / retire
```

## Output format: rollback.md

```markdown
# Rollback Procedure: [strategy-name]

## Trigger Conditions (any one sufficient)
- Live max drawdown exceeds XX% (audit threshold was 20%)
- 30-day live Sharpe < 0.3 for 2 consecutive months
- Data feed failure > 24 hours
- Human decision

## Rollback Steps
1. Close all open positions (market order, documented)
2. Set strategy status = paused in strategies.md
3. Record live performance in audit-report.md (append section)
4. Human decides: retire / investigate / revise

## Recovery Path
If investigating: return to stage 01_research with live performance data
If retiring: update strategies.md status = archived
```

## Outputs

| File/Folder | Description |
|-------------|-----------|
| `output/package/` | Deployment package (code + tests + README + requirements) |
| `output/monitoring.md` | Monitoring plan with alert thresholds |
| `output/rollback.md` | Rollback procedure |
| `output/deployed.md` | Deployment summary — pipeline complete |

## Output format: deployed.md

```markdown
# Deployed: [strategy-name]
Date packaged: YYYY-MM-DD
Omega pipeline: COMPLETE

## Summary
- Strategy: [strategy name]
- Audit verdict: PASS (see ../03_audit/output/audit-report.md)
- Package: output/package/
- Monitoring: output/monitoring.md
- Rollback: output/rollback.md

## Live Status
- Status: READY (not yet live, awaiting human decision)
- Deployed live: [YYYY-MM-DD / not yet]
- Live account: [account name / not yet]

## Notes
[Notes from the human]
```

## Capability required

`reasoning-high` — for verifying documentation completeness and consistency

## Human check (Final Gate)

Before the strategy is considered production-ready:
1. Read `output/package/README.md` — are the instructions sufficient to run without help?
2. Read `output/monitoring.md` — are the alert thresholds reasonable?
3. Read `output/rollback.md` — is the rollback procedure clear and executable?
4. Verify: `requirements.txt` matches conventions.md
5. If approved, the pipeline is complete for this strategy
6. Update `../_shared/strategies.md`: status `in-audit` → `passed`

## Fail behavior

- If prerequisites are not met (no PASS or no approval):
  → Stop immediately. Write `output/blocked-YYYY-MM-DD.md` with the specific reason
  → Return to the stage requiring completion
  → There are no exceptions to this human gate

- If the package is incomplete when created:
  → Write `output/incomplete-YYYY-MM-DD.md` with the list of missing items
  → Stop. The human decides whether to proceed or return to development

- **No live deployment without monitoring.md and rollback.md**
- **deployed.md does not mean the strategy is running live — it only means the pipeline is complete**
