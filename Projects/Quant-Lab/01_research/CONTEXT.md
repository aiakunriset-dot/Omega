# CONTEXT.md — L2 Stage Contract (01_research/)

## One job

Menghasilkan satu `research-brief.md` yang mendokumentasikan hipotesis strategi,
parameter awal, edge yang dieksploitasi, dan syarat data — cukup jelas untuk
diimplementasikan oleh stage 02_development tanpa pertanyaan tambahan.

## Inputs

**Working** (berubah per strategi):
- `../_shared/strategies.md` — baca status `in-research` untuk tahu strategi mana

**Reference** (stabil):
- `../_shared/conventions.md` — metrik threshold, data requirements, naming
- `../../_shared/rules.md` — global rules
- `../../_shared/providers.md` — capability routing

## Process

1. Baca `../_shared/strategies.md` — temukan entri dengan status `in-research`
2. Jika tidak ada yang `in-research`, stop dan lapor ke human
3. Pelajari hipotesis strategi: mekanisme, timeframe, aset, edge yang dieksploitasi
4. Identifikasi parameter utama dan range wajar berdasarkan literatur
5. Tentukan data requirements (sumber, frekuensi, minimum history)
6. Identifikasi risiko spesifik strategi (overfitting, regime change, liquidity)
7. Tulis `output/research-brief.md` menggunakan format di bawah
8. Update status di `../_shared/strategies.md` dari `in-research` → tetap `in-research`
   (status berubah ke `in-development` HANYA setelah human approve)

## Output format: research-brief.md

```markdown
# Research Brief: [nama-strategi]
Date: YYYY-MM-DD
Status: awaiting-approval

## Hypothesis
[Satu kalimat: apa yang dieksploitasi dan mengapa edge itu ada]

## Market
- Asset: [e.g., BTC/USDT]
- Timeframe: [e.g., 1h]
- Exchange: [e.g., Binance Spot]

## Edge Rationale
[2-3 paragraf: mengapa inefficiency ini ada, mengapa belum di-arbitrage habis]

## Entry Signal
[Kondisi entry yang spesifik dan testable]

## Exit Signal
[Kondisi exit: take profit, stop loss, time-based]

## Initial Parameters
| Parameter | Value | Range untuk sweep | Rationale |
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

| File | Deskripsi |
|------|-----------|
| `output/research-brief.md` | Brief lengkap siap review |
| `output/question-YYYY-MM-DD.md` | Jika ada ambiguitas — tulis di sini dan stop |

## Capability required

`research-long` — lihat `../../_shared/providers.md`

## Human check

Sebelum stage 02_development dimulai:
1. Baca `output/research-brief.md` seluruhnya
2. Verifikasi: apakah edge yang diidentifikasi masuk akal?
3. Verifikasi: apakah parameter range wajar?
4. Verifikasi: apakah risk management sesuai conventions.md?
5. Jika setuju → buat file `output/approved-research-YYYY-MM-DD.md` berisi:
   ```
   Approved by: [nama]
   Date: YYYY-MM-DD
   Strategy: [nama strategi]
   Approved for: development
   Notes: [catatan tambahan jika ada]
   ```
6. Update `../_shared/strategies.md`: status `in-research` → `in-development`

## Fail behavior

- Jika tidak ada strategi `in-research` di strategies.md:
  → Tulis `output/question-YYYY-MM-DD.md`: "No strategy with status in-research found."
  → Stop. Jangan invent strategi sendiri.

- Jika sumber data tidak tersedia atau edge tidak bisa divalidasi:
  → Tulis apa yang bisa diselesaikan ke `output/research-brief-partial-YYYY-MM-DD.md`
  → Tulis `output/question-YYYY-MM-DD.md` dengan pertanyaan spesifik
  → Stop. Human putuskan: lanjut dengan asumsi atau cari sumber lain.

- Jika ada ambiguitas fundamental dalam hipotesis:
  → Jangan asumsikan. Tulis pertanyaan ke `output/question-YYYY-MM-DD.md`
  → Stop dan tunggu jawaban human.

- **Dalam kondisi apapun: tidak ada penghapusan file. Tidak ada overwrite tanpa backup.**
