# Research Brief: momentum-btc-daily
Date: 2026-09-25
Status: awaiting-approval

## Hypothesis
BTC/USDT may exhibit persistent directional movement after a breakout above its 20-day high when the breakout occurs with volume above its recent average; entering at the next tradable session and exiting on a close below the 10-day low or an ATR-based stop may capture continuation while limiting losses during failed breakouts.

## Market
- Asset: BTC/USDT
- Timeframe: 1d
- Exchange: Binance Spot or another exchange with continuous, timestamped daily OHLCV

## Edge Rationale
The proposed edge is time-series momentum: an asset that has recently moved strongly in one direction can continue in that direction because information is incorporated gradually, traders adjust positions over time, and trend-following flows can reinforce persistence. A breakout above a rolling high is a testable proxy for a new upward regime; above-average volume is used as a confirmation filter rather than as proof of predictive power.

The edge is only a hypothesis for BTC and must be tested out of sample. Crypto markets trade continuously, have changing liquidity and fee conditions, and can experience abrupt regime changes. The strategy should therefore use point-in-time signals, explicit transaction costs and slippage, walk-forward evaluation, and a comparison against a breakout-only version to determine whether the volume filter adds value.

## Entry Signal
At the daily close, calculate the prior 20 completed daily highs and the prior 20-day average volume. Enter long at the next session's available price only when:

1. The current close is above the prior 20-day high.
2. The current volume is above the prior 20-day average volume.
3. No position is already open.

The signal must use only completed candles. The entry price, spread, fee, and slippage must be recorded in the backtest.

## Exit Signal
Exit the long position at the next available price after either condition occurs:

- The daily close falls below the prior 10-day low.
- The close reaches an ATR-based protective stop, initially defined as entry price minus 3 times the 14-day ATR.

The stop must not be moved using future information. A development-stage implementation should define whether the stop is evaluated intraday or at the close and apply that convention consistently.

## Initial Parameters
| Parameter | Value | Sweep range | Rationale |
|-----------|-------|-------------|-----------|
| Breakout lookback | 20 trading days | 10-60 days | Standard medium-term breakout baseline |
| Volume average lookback | 20 trading days | 10-60 days | Matches the breakout regime window |
| Volume confirmation | Current volume > prior average volume | 0.8-1.5 x prior average | Tests whether confirmation strength matters |
| Exit low lookback | 10 trading days | 5-30 days | Shorter exit window aims to limit trend reversals |
| ATR lookback | 14 days | 10-30 days | Common volatility-estimation baseline |
| ATR stop multiple | 3.0 ATR | 2.0-5.0 ATR | Tests stop tightness versus noise tolerance |
| Position size | 10% of portfolio notional | 5-25% | Limits single-position concentration during research |

## Risk Management
- Position size: 10% of portfolio notional per trade
- Stop loss method: ATR-based, initially 3 x 14-day ATR below entry
- Max open positions: 1
- Max drawdown limit: 20% at the strategy level, per conventions.md
- Transaction costs: model at least 0.1% per crypto trade, plus documented slippage
- No leverage in the initial research version

## Data Requirements
- Minimum history: 3 years, preferably a longer history covering bull, bear, and sideways regimes
- Data source: Binance Spot klines or an equivalent exchange OHLCV source
- Frequency: Daily OHLCV with UTC timestamps: `timestamp, open, high, low, close, volume`
- Data checks: remove duplicate timestamps, verify chronological order, document missing candles, and avoid silent interpolation
- Evaluation split: 80% in-sample for development and 20% out-of-sample for the final evaluation

## Expected Performance (Hypothesis Only)
- Sharpe Ratio target: 0.5-1.5 (audit threshold: >= 1.0)
- Max Drawdown target: 15-30% (audit threshold: <= 20%)
- These are research expectations, not observed results. The strategy must not be promoted without walk-forward testing, modeled costs, and at least 30 out-of-sample trades where feasible.

## Risks
1. **False breakouts — high likelihood, high impact:** BTC can break a rolling high and reverse quickly; the 10-day exit and ATR stop may still produce clustered losses.
2. **Regime change — medium likelihood, high impact:** A parameter set that worked in a trending market may fail in a range-bound or volatility-compressed market.
3. **Liquidity and execution — medium likelihood, medium to high impact:** Fees, spread, slippage, exchange outages, and volume-quality differences can materially reduce performance.
4. **Overfitting — medium likelihood, high impact:** Searching many lookbacks and stop multiples can select noise; parameter sweeps must be limited and evaluated walk-forward.

## References
- Moskowitz, Tobias J., Yao Hua Ooi, and Lasse H. Pedersen (2012), "Time Series Momentum," Journal of Financial Economics. https://doi.org/10.1016/j.jfineco.2011.11.003
- Hurst, Brian, Yao Hua Ooi, and Lasse H. Pedersen (2017), "A Century of Evidence on Trend-Following Investing," Journal of Portfolio Management. https://doi.org/10.3905/jpm.2017.43.1.015
- Binance Spot API documentation, market data and klines endpoints. https://developers.binance.com/docs/binance-spot-api-docs/rest-api/market-data-endpoints
- Wilder, J. Welles (1978), New Concepts in Technical Trading Systems, source of the Average True Range framework.
