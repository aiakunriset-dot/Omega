# CONTEXT.md — L2 Stage Contract (04_production/)

## One job

Mengemas strategi yang lulus audit menjadi satu package deployment-ready:
kode final, dokumentasi operasional, monitoring plan, dan rollback procedure —
cukup lengkap untuk dijalankan oleh siapapun tanpa penjelasan tambahan.

## Prerequisite check (HARD GATE — tidak ada pengecualian)

Sebelum mulai, verifikasi ketiga file ini ADA:
- `../03_audit/output/audit-report.md` berisi kata `**PASS**` ✓
- `../03_audit/output/approved-audit-YYYY-MM-DD.md` ada ✓
- `../02_development/output/[strategy-name].py` ada ✓

Jika salah satu tidak ada atau audit-report tidak berisi PASS:
→ Stop. Kembali ke stage 03_audit. Tidak ada pengecualian.

## Inputs

**Working** (per run):
- `../03_audit/output/audit-report.md` — hasil audit (harus PASS)
- `../03_audit/output/approved-audit-YYYY-MM-DD.md` — approval manusia
- `../02_development/output/[strategy-name].py` — kode final
- `../02_development/output/test_[strategy-name].py` — test suite

**Reference** (stabil):
- `../01_research/output/research-brief.md` — untuk dokumentasi
- `../_shared/conventions.md` — library versions, standards
- `../../_shared/rules.md` — global rules

## Process

1. Verifikasi SEMUA prerequisites — berhenti jika ada yang kurang
2. Buat folder `output/package/`
3. Copy kode final: `output/package/[strategy-name].py`
4. Copy test suite: `output/package/test_[strategy-name].py`
5. Tulis `output/package/README.md` — cara menjalankan strategi
6. Tulis `output/package/requirements.txt` — exact versions dari conventions
7. Tulis `output/monitoring.md` — apa yang dipantau dan threshold alert
8. Tulis `output/rollback.md` — prosedur jika strategi underperform live
9. Tulis `output/deployed.md` — ringkasan deployment (bukan berarti sudah live)

## Output format: monitoring.md

```markdown
# Monitoring Plan: [nama-strategi]
Date: YYYY-MM-DD

## Metrics to Monitor (Daily)

| Metrik | Alert Threshold | Action |
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
# Rollback Procedure: [nama-strategi]

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

| File/Folder | Deskripsi |
|-------------|-----------|
| `output/package/` | Deployment package (kode + tests + README + requirements) |
| `output/monitoring.md` | Monitoring plan dengan alert thresholds |
| `output/rollback.md` | Rollback procedure |
| `output/deployed.md` | Deployment summary — pipeline complete |

## Output format: deployed.md

```markdown
# Deployed: [nama-strategi]
Date packaged: YYYY-MM-DD
Omega pipeline: COMPLETE

## Summary
- Strategy: [nama]
- Audit verdict: PASS (lihat ../03_audit/output/audit-report.md)
- Package: output/package/
- Monitoring: output/monitoring.md
- Rollback: output/rollback.md

## Live Status
- Status: READY (belum live, menunggu keputusan human)
- Deployed live: [YYYY-MM-DD / belum]
- Live account: [nama akun / belum]

## Notes
[Catatan dari human]
```

## Capability required

`reasoning-high` — untuk verifikasi kelengkapan dan konsistensi dokumentasi

## Human check (Final Gate)

Sebelum strategi dianggap production-ready:
1. Baca `output/package/README.md` — apakah instruksi cukup untuk dijalankan tanpa bantuan?
2. Baca `output/monitoring.md` — apakah alert thresholds masuk akal?
3. Baca `output/rollback.md` — apakah prosedur rollback jelas dan executable?
4. Verifikasi: `requirements.txt` sesuai conventions.md
5. Jika setuju → pipeline selesai untuk strategi ini
6. Update `../_shared/strategies.md`: status `in-audit` → `passed`

## Fail behavior

- Jika prerequisite tidak terpenuhi (tidak ada PASS atau tidak ada approval):
  → Stop segera. Tulis `output/blocked-YYYY-MM-DD.md` dengan alasan spesifik
  → Kembali ke stage yang membutuhkan completion
  → Tidak ada pengecualian untuk human gate ini

- Jika package tidak lengkap saat dibuat:
  → Tulis `output/incomplete-YYYY-MM-DD.md` dengan daftar item yang kurang
  → Stop. Human putuskan apakah lanjutkan atau kembali ke development

- **Tidak ada deployment live tanpa monitoring.md dan rollback.md**
- **deployed.md bukan berarti strategi sudah berjalan live — hanya berarti pipeline selesai**
