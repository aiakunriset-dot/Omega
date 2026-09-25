# CONTEXT.md — L2 Stage Contract (03_audit/)

## One job

Produce `audit-report.md` with a PASS or FAIL verdict based on
walk-forward backtesting and stress tests, using metrics from conventions.md.
There is no grey area — every metric has a clear threshold.

## Prerequisite check

Before starting, verify:
- `../02_development/output/[strategy-name].py` exists ✓
- `../02_development/output/approved-development-YYYY-MM-DD.md` exists ✓

If either is missing, stop. Return to stage 02_development.

## Inputs

**Working** (per run):
- `../02_development/output/[strategy-name].py` — code to audit
- `../02_development/output/test_[strategy-name].py` — test suite

**Reference** (stable):
- `../_shared/conventions.md` — metric thresholds PASS/FAIL
- `../01_research/output/research-brief.md` — hypothesis to validate
- `../../_shared/rules.md` — global rules

## Process

1. Verify prerequisites (file exists + approval)
2. Run the test suite — all tests must pass before proceeding
3. Run walk-forward backtesting:
   - Split data: 80% in-sample, 20% out-of-sample (OOS)
  - Calculate metrics on the OOS period only (in-sample is for fitting only)
4. Calculate all metrics from conventions.md on OOS data
5. Run stress tests:
   - High volatility period (if present in data)
   - Bear market period (if relevant)
   - Parameter sensitivity: change each parameter ±20%, observe degradation
6. Check for overfitting: how many parameters versus trades?
7. Write `output/audit-report.md` with all results
8. Set the verdict: PASS if ALL thresholds are met, FAIL if any are not

## Output format: audit-report.md

```markdown
# Audit Report: [strategy-name]
Date: YYYY-MM-DD
Verdict: **PASS** / **FAIL**

## Strategy
Brief: ../01_research/output/research-brief.md
Code: ../02_development/output/[strategy-name].py

## Backtest Configuration
- Data: [sumber, frekuensi]
- Total period: YYYY-MM-DD to YYYY-MM-DD
- In-sample: YYYY-MM-DD to YYYY-MM-DD (80%)
- Out-of-sample: YYYY-MM-DD to YYYY-MM-DD (20%)
- Transaction costs: [%] per trade
- Slippage: [model]

## Metrics (Out-of-Sample)

| Metric | Value | Threshold | Status |
|--------|-------|-----------|--------|
| Sharpe Ratio | X.XX | ≥ 1.0 | PASS/FAIL |
| Max Drawdown | XX.X% | ≤ 20% | PASS/FAIL |
| CAGR | XX.X% | > 0% | PASS/FAIL |
| Win Rate | XX.X% | ≥ 45% | PASS/FAIL |
| Profit Factor | X.XX | ≥ 1.3 | PASS/FAIL |
| Total Trades (OOS) | N | ≥ 30 | PASS/FAIL |

## Walk-Forward Results

| Window | Sharpe | Max DD | Status |
|--------|--------|--------|--------|
| [period 1] | | | |
| [period 2] | | | |

## Stress Tests

| Test | Result | Notes |
|------|--------|-------|
| High volatility period | | |
| Parameter sensitivity ±20% | | |

## Overfitting Assessment
- Parameters count: N
- Trades in OOS: N
- Ratio: [rules of thumb: min 10 trades per parameter]
- Assessment: [OK / CONCERN / FAIL]

## Issues Found
[All concerns, even if overall PASS]

## Verdict Justification
**[PASS / FAIL]**

[Explanatory paragraph: why this verdict was given]

[If FAIL: Return to stage [01/02] — specific issue: ...]
```

## Outputs

| File | Description |
|------|-----------|
| `output/audit-report.md` | Complete report with verdict |
| `output/audit-data/` | Raw backtest data (CSV) for reference |

## Capability required

`math-stats` — see `../../_shared/providers.md`

## Human check

Before stage 04_production begins (ONLY if the verdict is PASS):
1. Read `audit-report.md` in full
2. Verify: are all thresholds met?
3. Check the stress test — are the results reasonable?
4. Check the overfitting assessment
5. Read "Issues Found" — are any concerns unacceptable?
6. If approved, create `output/approved-audit-YYYY-MM-DD.md`:
   ```
   Approved by: [name]
   Date: YYYY-MM-DD
   Verdict: PASS
   Strategy: [strategy name]
   Ready for: production packaging
   Notes: [notes]
   ```

## Fail behavior

- If any test in the suite fails:
  → Log to `../../_shared/errors.md`
  → Write `output/audit-report.md` with a FAIL verdict
  → Note: "Test suite failed — return to 02_development"
  → Stop. Do not continue to backtesting.

- If backtest fails to run (data error, code error):
  → Log to `../../_shared/errors.md` (R1 format)
  → Save partial results to `output/audit-data/partial-YYYY-MM-DD/`
  → Write `output/audit-report.md` with a FAIL verdict and technical reason
  → Stop.

- If the verdict is FAIL:
  → Write the complete report anyway (with all data)
  → Update `../_shared/strategies.md`: keep status `in-audit` until decided
  → The human decides whether to return to stage 01 (revise hypothesis) or stage 02 (fix code)
  → Never send a FAIL strategy to production.

- If the parameter sensitivity test shows extreme degradation (>50% Sharpe drop):
  → Mark it as FAIL even if the primary metrics PASS
  → This is an overfitting signal

- **Do not delete backtest data. Save all runs in `audit-data\`.**
