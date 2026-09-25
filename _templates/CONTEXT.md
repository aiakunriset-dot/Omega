# CONTEXT.md — L1 Pipeline Map (Projects/[PROJECT_NAME]/)

## One job

[Satu kalimat: apa yang proyek ini hasilkan dari ujung ke ujung]

## Pipeline stages

| Stage | Folder | Status check |
|-------|--------|--------------|
| 1. [nama] | `01_[nama]\` | `output\[file]` exists? |
| 2. [nama] | `02_[nama]\` | `output\[file]` exists? |
| 3. [nama] | `03_[nama]\` | `output\[file]` exists? |

## State detection

Scan folder `output\` per stage secara berurutan:
- `01_.../output/` kosong → Stage 1 aktif
- `01_.../output/` berisi file → Stage 1 selesai, cek stage 2
- `02_.../output/` kosong → Stage 2 aktif
- *(dan seterusnya)*

Tidak perlu database. Filesystem adalah state machine.

## Human gates

Gate wajib sebelum lanjut ke stage berikutnya:
- Setelah Stage [X]: `output\approved-[task]-YYYY-MM-DD.md` harus ada
- Setelah Stage [Y]: [kondisi approval]

## Shared resources

- `_shared\[file].md` — [deskripsi]
- `../../_shared\rules.md` — global rules (always in effect)
- `../../_shared\providers.md` — capability routing

## Capability required (default)

`general` — override di setiap stage CONTEXT.md jika perlu

---
*Pipeline dibuat: YYYY-MM-DD*
