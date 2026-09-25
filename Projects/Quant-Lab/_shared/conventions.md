# Quant-Lab Conventions

Stable conventions across all stages. Read as reference, not working input.
Change only with human approval and an entry in changelog.md.

## Data

| Convention | Value |
|----------|-------|
| Timezone | UTC — all timestamps |
| Price | Adjusted close, unless otherwise stated |
| Missing data | Drop row — never silently interpolate |
| OHLCV format | `timestamp, open, high, low, close, volume` |
| Decimal | 8 digits for crypto, 4 for forex/equities |

## Backtesting

| Requirement | Value |
|-------------|-------|
| Minimum data history | 3 years |
| Walk-forward | Required — no in-sample-only |
| Out-of-sample period | Final 20% of total data |
| Transaction costs | Must be modeled (minimum 0.1% per crypto trade) |
| Slippage | Must be modeled for volume > 0.5% of market depth |
| Lookahead bias check | Required — validate all data joins |

## Minimum Metrics for an Audit PASS

| Metric | Threshold |
|--------|-----------|
| Sharpe Ratio (OOS) | ≥ 1.0 |
| Max Drawdown (OOS) | ≤ 20% |
| CAGR (OOS) | > 0% |
| Win Rate | ≥ 45% |
| Profit Factor | ≥ 1.3 |
| Min trades (OOS) | ≥ 30 (for statistical significance) |

## Code

| Convention | Value |
|----------|-------|
| Python version | 3.10+ |
| Type hints | Required in all function signatures |
| Global state | Not allowed |
| File per strategy | One strategy = one file |
| Test file | `test_[strategy_name].py` alongside `[strategy_name].py` |
| Max function length | 50 lines — split if longer |

## Libraries (Standard Quant Stack)

```
pandas>=1.5.0        # data manipulation
numpy>=1.23.0        # numerics
scipy>=1.9.0         # statistics
matplotlib>=3.6.0    # plotting (audit reports)
vectorbt>=0.24.0     # backtesting engine
pytest>=7.0.0        # testing
```

No new library without discussion and an entry in changelog.md.

## Naming

| Item | Convention | Example |
|------|----------|--------|
| Strategy file | `snake_case.py` | `momentum_btc_daily.py` |
| Output markdown | `YYYY-MM-DD-name.md` | `2026-09-23-research-brief.md` |
| Folder stage | `NN_name` | `01_research` |
| Variable | `snake_case` | `sharpe_ratio` |
| Constant | `UPPER_SNAKE` | `MIN_SHARPE` |

## Cloud Compute (effective from V2.0)

- Heavy backtests → Google Colab or Kaggle
- Store notebooks in the stage `references\`
- Return results as markdown to the stage `output\`
- Notebook template at `01_research\references\colab-template.ipynb`

## Error Handling

- Record every failed strategy in `strategies.md` with status `failed`
- Record every failed run in `../../_shared\errors.md`
- Do not delete historical data — preserve every failure for learning

---
*conventions.md created: 2026-09-23 · Change with human approval*
