# Projects\Quant-Lab\ — Entry Point

Kamu ada di Quant-Lab. Baca `SOUL.md` dan `CONTEXT.md` sebelum melakukan apapun.

## Langkah masuk proyek

1. Baca `SOUL.md` — identitas dan constraints AI di proyek ini
2. Baca `CONTEXT.md` — peta pipeline dan state saat ini
3. Scan `output\` per stage untuk menentukan stage aktif
4. Pergi ke stage aktif, baca `CONTEXT.md`-nya

## Deskripsi Proyek

Quant-Lab adalah pipeline untuk riset, pengembangan, audit, dan produksi
strategi trading kuantitatif. Setiap run menghasilkan satu strategi yang
telah divalidasi dan siap digunakan.

## Pipeline

| Stage | Folder | Selesai jika |
|-------|--------|--------------|
| 1. Research | `01_research\` | `output\research-brief.md` ada |
| 2. Development | `02_development\` | `output\strategy.py` ada |
| 3. Audit | `03_audit\` | `output\audit-report.md` berisi `PASS` |
| 4. Production | `04_production\` | `output\deployed.md` ada |

## Human Gates (Mandatory)

- **Setelah Stage 1:** Human approve `research-brief.md` sebelum kode ditulis
- **Setelah Stage 3:** Human approve `audit-report.md` sebelum production

## Shared Resources Proyek Ini

- `_shared\strategies.md` — katalog strategi (status per strategi)
- `_shared\conventions.md` — konvensi data, backtest, kode
- `../../_shared\rules.md` — aturan global (selalu berlaku)
- `../../_shared\providers.md` — capability routing

---
*Quant-Lab v1.0 · Dibuat: 2026-09-23 · Omega v1.0*
