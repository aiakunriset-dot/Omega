# CONTEXT.md — L2 Stage Contract (03_audit/)

## One job

Menghasilkan `audit-report.md` dengan verdict PASS atau FAIL berdasarkan
backtest walk-forward dan stress test, menggunakan metrik dari conventions.md.
Tidak ada grey area — setiap metrik ada threshold yang jelas.

## Prerequisite check

Sebelum mulai, verifikasi:
- `../02_development/output/[strategy-name].py` ada ✓
- `../02_development/output/approved-development-YYYY-MM-DD.md` ada ✓

Jika salah satu tidak ada → stop. Kembali ke stage 02_development.

## Inputs

**Working** (per run):
- `../02_development/output/[strategy-name].py` — kode yang akan diaudit
- `../02_development/output/test_[strategy-name].py` — test suite

**Reference** (stabil):
- `../_shared/conventions.md` — threshold metrik PASS/FAIL
- `../01_research/output/research-brief.md` — hipotesis yang harus divalidasi
- `../../_shared/rules.md` — global rules

## Process

1. Verifikasi prerequisites (file exists + approval)
2. Jalankan test suite — semua harus pass sebelum lanjut
3. Jalankan backtest walk-forward:
   - Split data: 80% in-sample, 20% out-of-sample (OOS)
   - Hitung metrik pada OOS period saja (in-sample hanya untuk fitting)
4. Hitung semua metrik dari conventions.md pada OOS data
5. Jalankan stress tests:
   - Periode high volatility (jika ada dalam data)
   - Periode bear market (jika relevan)
   - Parameter sensitivity: ubah setiap parameter ±20%, amati degradasi
6. Cek potensi overfitting: berapa parameter vs jumlah trades?
7. Tulis `output/audit-report.md` dengan semua hasil
8. Tentukan verdict: PASS jika SEMUA threshold terpenuhi, FAIL jika satu pun tidak

## Output format: audit-report.md

```markdown
# Audit Report: [nama-strategi]
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

| Metrik | Nilai | Threshold | Status |
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
[Semua concern, bahkan jika overall PASS]

## Verdict Justification
**[PASS / FAIL]**

[Paragraf penjelasan: mengapa verdict ini diberikan]

[Jika FAIL: Return to stage [01/02] — specific issue: ...]
```

## Outputs

| File | Deskripsi |
|------|-----------|
| `output/audit-report.md` | Laporan lengkap dengan verdict |
| `output/audit-data/` | Raw backtest data (CSV) untuk referensi |

## Capability required

`math-stats` — lihat `../../_shared/providers.md`

## Human check

Sebelum stage 04_production dimulai (HANYA jika verdict PASS):
1. Baca `audit-report.md` seluruhnya
2. Verifikasi: apakah semua threshold terpenuhi?
3. Periksa stress test — apakah hasilnya masuk akal?
4. Periksa overfitting assessment
5. Baca "Issues Found" — apakah ada concern yang tidak dapat diterima?
6. Jika setuju → buat `output/approved-audit-YYYY-MM-DD.md`:
   ```
   Approved by: [nama]
   Date: YYYY-MM-DD
   Verdict: PASS
   Strategy: [nama]
   Ready for: production packaging
   Notes: [catatan]
   ```

## Fail behavior

- Jika test suite ada yang gagal:
  → Log ke `../../_shared/errors.md`
  → Tulis `output/audit-report.md` dengan verdict FAIL
  → Keterangan: "Test suite failed — return to 02_development"
  → Stop. Jangan lanjut backtest.

- Jika backtest gagal dijalankan (data error, code error):
  → Log ke `../../_shared/errors.md` (format R1)
  → Simpan partial results ke `output/audit-data/partial-YYYY-MM-DD/`
  → Tulis `output/audit-report.md` dengan verdict FAIL dan alasan teknis
  → Stop.

- Jika verdict FAIL:
  → Tulis laporan lengkap tetap (dengan semua data)
  → Update `../_shared/strategies.md`: status tetap `in-audit` sampai diputuskan
  → Human putuskan: kembali ke stage 01 (revisi hipotesis) atau stage 02 (perbaiki kode)
  → Jangan pernah kirim strategi FAIL ke production.

- Jika parameter sensitivity test menunjukkan degradasi ekstrem (>50% Sharpe drop):
  → Tandai sebagai FAIL meski metrik utama PASS
  → Ini adalah overfitting signal

- **Tidak ada penghapusan data backtest. Semua run disimpan di `audit-data\`.**
