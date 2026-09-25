# CONTEXT.md — L1 Pipeline Map (Projects/Quant-Lab/)

## One job

Menghasilkan satu strategi trading kuantitatif yang telah divalidasi secara
statistik dan dikemas siap untuk monitoring dan deployment.

## Pipeline stages

| # | Stage | Folder | Output yang ditunggu |
|---|-------|--------|----------------------|
| 1 | Research | `01_research\` | `output\research-brief.md` |
| 2 | Development | `02_development\` | `output\strategy.py` |
| 3 | Audit | `03_audit\` | `output\audit-report.md` (harus berisi `PASS`) |
| 4 | Production | `04_production\` | `output\deployed.md` |

## State detection

Scan folder `output\` per stage secara berurutan:
```
01_research/output/    kosong → Stage 1 aktif (start here)
01_research/output/    berisi → Stage 1 selesai, cek stage 2
02_development/output/ kosong → Stage 2 aktif
02_development/output/ berisi → Stage 2 selesai, cek stage 3
03_audit/output/       kosong → Stage 3 aktif
03_audit/output/       berisi audit-report.md dengan PASS → Stage 3 selesai
04_production/output/  kosong → Stage 4 aktif
04_production/output/  berisi deployed.md → Pipeline complete
```

Tidak perlu database. Filesystem adalah state machine.

## Human gates (mandatory)

| Gate | Trigger | File yang diperlukan |
|------|---------|----------------------|
| Research → Development | Human approve research-brief.md | `01_research/output/approved-research-YYYY-MM-DD.md` |
| Audit → Production | Human approve audit-report.md | `03_audit/output/approved-audit-YYYY-MM-DD.md` |

## Shared resources

- `_shared\strategies.md` — katalog strategi dan statusnya
- `_shared\conventions.md` — konvensi data, kode, dan backtest
- `../../_shared\rules.md` — global rules (always in effect)
- `../../_shared\providers.md` — capability routing

## Capability defaults per stage

| Stage | Capability |
|-------|------------|
| 01_research | `research-long` |
| 02_development | `coding-fast` |
| 03_audit | `math-stats` |
| 04_production | `reasoning-high` |
