# Quant-Lab Conventions

Konvensi stabil lintas semua stage. Dibaca sebagai reference, bukan working input.
Ubah hanya dengan approval human dan entry di changelog.md.

## Data

| Konvensi | Nilai |
|----------|-------|
| Timezone | UTC — semua timestamp |
| Harga | Adjusted close, kecuali dinyatakan lain |
| Missing data | Drop row — tidak pernah interpolasi diam-diam |
| OHLCV format | `timestamp, open, high, low, close, volume` |
| Desimal | 8 digit untuk crypto, 4 untuk forex/equities |

## Backtesting

| Requirement | Nilai |
|-------------|-------|
| Minimum data history | 3 tahun |
| Walk-forward | Wajib — tidak ada in-sample-only |
| Out-of-sample period | 20% terakhir dari total data |
| Transaction costs | Wajib dimodelkan (min 0.1% per trade crypto) |
| Slippage | Wajib dimodelkan untuk volume > 0.5% market depth |
| Lookahead bias check | Wajib — validasi semua data join |

## Metrik Minimum untuk PASS Audit

| Metrik | Threshold |
|--------|-----------|
| Sharpe Ratio (OOS) | ≥ 1.0 |
| Max Drawdown (OOS) | ≤ 20% |
| CAGR (OOS) | > 0% |
| Win Rate | ≥ 45% |
| Profit Factor | ≥ 1.3 |
| Min trades (OOS) | ≥ 30 (untuk signifikansi statistik) |

## Code

| Konvensi | Nilai |
|----------|-------|
| Python version | 3.10+ |
| Type hints | Wajib di semua function signatures |
| Global state | Tidak diizinkan |
| File per strategi | Satu strategi = satu file |
| Test file | `test_[strategy_name].py` sejajar dengan `[strategy_name].py` |
| Max function length | 50 baris — split jika lebih |

## Libraries (Standard Quant Stack)

```
pandas>=1.5.0        # data manipulation
numpy>=1.23.0        # numerics
scipy>=1.9.0         # statistics
matplotlib>=3.6.0    # plotting (audit reports)
vectorbt>=0.24.0     # backtesting engine
pytest>=7.0.0        # testing
```

Tidak ada library baru tanpa diskusi dan entry di changelog.md.

## Naming

| Item | Konvensi | Contoh |
|------|----------|--------|
| Strategy file | `snake_case.py` | `momentum_btc_daily.py` |
| Output markdown | `YYYY-MM-DD-nama.md` | `2026-09-23-research-brief.md` |
| Folder stage | `NN_nama` | `01_research` |
| Variable | `snake_case` | `sharpe_ratio` |
| Constant | `UPPER_SNAKE` | `MIN_SHARPE` |

## Cloud Compute (berlaku mulai V2.0)

- Backtest berat → Google Colab atau Kaggle
- Notebook disimpan di stage `references\`
- Hasil dikembalikan sebagai markdown ke stage `output\`
- Notebook template di `01_research\references\colab-template.ipynb`

## Error Handling

- Setiap failed strategy dicatat di `strategies.md` dengan status `failed`
- Setiap failed run dicatat di `../../_shared\errors.md`
- Tidak ada penghapusan data historis — semua failure disimpan sebagai pembelajaran

---
*conventions.md dibuat: 2026-09-23 · Ubah dengan approval human*
