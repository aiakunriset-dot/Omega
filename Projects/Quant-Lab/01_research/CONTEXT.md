# CONTEXT.md — L2 Stage Contract (01_research/)

## One job

Produce one `research-brief.md` documenting the strategy hypothesis,
initial parameters, exploited edge, and data requirements — clear enough
for stage 02_development to implement without additional questions.

## Inputs

**Working** (changes per strategy):
- `../_shared/strategies.md` — read the `in-research` status to identify the strategy

**Reference** (stable):
- `../_shared/conventions.md` — metric thresholds, data requirements, naming
- `../../_shared/rules.md` — global rules
- `../../_shared/providers.md` — capability routing

## Process

1. Read `../_shared/strategies.md` — find the entry with status `in-research`
2. If none has `in-research`, stop and report to the human
3. Study the strategy hypothesis: mechanism, timeframe, assets, and exploited edge
4. Identify key parameters and reasonable ranges based on the literature
5. Determine data requirements (source, frequency, minimum history)
6. Identify strategy-specific risks (overfitting, regime change, liquidity)
7. Write `output/research-brief.md` using the format below
8. Keep the status in `../_shared/strategies.md` as `in-research`
  (change it to `in-development` ONLY after human approval)

## Output format: research-brief.md

```markdown
# Research Brief: [nama-strategi]
Date: YYYY-MM-DD
Status: awaiting-approval

## Hypothesis
[One sentence: what is exploited and why the edge exists]

## Market
- Asset: [e.g., BTC/USDT]
- Timeframe: [e.g., 1h]
- Exchange: [e.g., Binance Spot]

## Edge Rationale
[2-3 paragraphs: why this inefficiency exists and why it has not been fully arbitraged]

## Entry Signal
[Specific and testable entry conditions]

## Exit Signal
[Kondisi exit: take profit, stop loss, time-based]

## Initial Parameters
| Parameter | Value | Sweep range | Rationale |
|-----------|-------|-------------------|-----------|
| [nama] | [nilai] | [min–max] | [mengapa] |

## Risk Management
- Position size: [% portfolio per trade]
- Stop loss method: [fixed % / ATR-based / dll]
- Max open positions: [N]
- Max drawdown limit: [% — sesuai conventions.md]

## Data Requirements
- Minimum history: [N tahun]
- Data source: [Binance API / Yahoo Finance / dll]
- Frequency: [OHLCV 1h / dll]

## Expected Performance (Hypothesis Only)
- Sharpe Ratio target: [range] (threshold: ≥ 1.0 per conventions)
- Max Drawdown target: [range] (threshold: ≤ 20% per conventions)

## Risks
1. [Risk 1 — likelihood, impact]
2. [Risk 2]

## References
- [Source 1]
```

## Outputs

| File | Description |
|------|-----------|
| `output/research-brief.md` | Complete brief ready for review |
| `output/question-YYYY-MM-DD.md` | If ambiguous, write here and stop |

## Capability required

`research-long` — see `../../_shared/providers.md`

## Human check

Before stage 02_development begins:
1. Read `output/research-brief.md` in full
2. Verify: is the identified edge reasonable?
3. Verify: are the parameter ranges reasonable?
4. Verify: does risk management comply with conventions.md?
5. If approved, create `output/approved-research-YYYY-MM-DD.md` containing:
   ```
   Approved by: [nama]
   Date: YYYY-MM-DD
   Strategy: [nama strategi]
   Approved for: development
  Notes: [additional notes if any]
   ```
6. Update `../_shared/strategies.md`: status `in-research` → `in-development`

## Revision workflow

- If the human rejects `research-brief.md`, keep the strategy status as `in-research`.
- The human must state the requested revisions before development begins.
- Revise the existing brief in place only after the requested changes are clear.
- Keep `Status: awaiting-approval` until a new human approval file exists.
- Do not create an approval file for a rejected or partially revised brief.

## Fail behavior

- If no `in-research` strategy exists in strategies.md:
  → Write `output/question-YYYY-MM-DD.md`: "No strategy with status in-research found."
  → Stop. Do not invent a strategy.

- If the data source is unavailable or the edge cannot be validated:
  → Write what can be completed to `output/research-brief-partial-YYYY-MM-DD.md`
  → Write `output/question-YYYY-MM-DD.md` with specific questions
  → Stop. The human decides whether to proceed with assumptions or find another source.

- If there is fundamental ambiguity in the hypothesis:
  → Do not assume. Write the question to `output/question-YYYY-MM-DD.md`
  → Stop and wait for the human's answer.

- **Under no circumstances may files be deleted. Do not overwrite without a backup.**
