# CONTEXT.md — L2 Stage Contract (0N_[stage-name]/)

## One job

[Satu kalimat: apa yang stage ini hasilkan. Tidak lebih dari satu output utama.]

## Inputs

**Working** (berubah setiap run):
- `../[path]/[file]` — [deskripsi]

**Reference** (stabil lintas run):
- `../_shared/[file]` — [deskripsi]
- `../../_shared/rules.md` — global rules

## Process

1. [Langkah pertama — spesifik]
2. [Langkah kedua — spesifik]
3. [Langkah ketiga — spesifik]
4. Tulis hasil ke `output/[nama-output].md`

## Outputs

| File | Deskripsi | Format |
|------|-----------|--------|
| `output/[nama].md` | [apa isinya] | Markdown |

## Capability required

`[capability-type]` — lihat `../../_shared/providers.md`

## Human check

Sebelum lanjut ke stage berikutnya:
1. [Apa yang human harus verifikasi]
2. [Kriteria lulus]
3. Jika setuju → buat file `output/approved-[task]-YYYY-MM-DD.md`

## Fail behavior

- Jika [kondisi gagal 1]:
  → [tindakan spesifik — jangan hapus file]
  → Stop. Human putuskan apakah retry.
- Jika [kondisi gagal 2]:
  → Simpan output parsial ke `output/fail-YYYY-MM-DD.md`
  → Log ke `../../_shared/errors.md`
  → Stop. Jangan lanjut ke stage berikutnya.
- **Dalam kondisi apapun: tidak ada penghapusan file.**

---
*Stage contract dibuat: YYYY-MM-DD*
