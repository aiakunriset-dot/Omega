# C:\Omega\ — Entry Point

Kamu ada di root Omega. Baca tabel ini, lalu pergi ke tujuan yang tepat.
Baca `_version.md` terlebih dahulu untuk memastikan kompatibilitas.

## Orientasi Cepat

| Saya ingin... | Pergi ke |
|---------------|----------|
| Kerja di proyek aktif | `Projects\[nama]\CLAUDE.md` |
| Buat proyek baru | Copy `_templates\` → `Projects\[nama]\`, baca `_shared\rules.md` |
| Lihat aturan global | `_shared\rules.md` |
| Pilih model / provider | `_shared\providers.md` |
| Setup tools | `_tools.md` |
| Lihat error yang pernah terjadi | `_shared\errors.md` |
| Lihat pola yang terbukti | `_shared\patterns.md` |
| Versi Omega | `_version.md` |

## Proyek Aktif

| Proyek | Folder | Deskripsi |
|--------|--------|-----------|
| Quant-Lab | `Projects\Quant-Lab\` | Riset & development strategi trading |

## Perintah Omega (jalankan dari project folder)

```powershell
# Status semua stage
icm status .\Projects\Quant-Lab

# Stage berikutnya
icm next .\Projects\Quant-Lab

# Dashboard (buka di browser)
icm dashboard .\Projects\Quant-Lab

# Validasi struktur
icm validate .\Projects\Quant-Lab --strict

# Review output stage sebelum approve
icm review stages\01_research --workspace .\Projects\Quant-Lab

# Record human approval
icm accept stages\01_research --workspace .\Projects\Quant-Lab --reviewer [nama] --note "[catatan]"
```

## Aturan Absolut

1. Baca `CONTEXT.md` stage sebelum mengerjakan apapun
2. Tulis output HANYA ke `output\` stage yang aktif
3. Tidak ada yang dihapus tanpa log di `_shared\errors.md` terlebih dahulu
4. Perubahan ke `_shared\` butuh approval manusia eksplisit
5. Tidak ada nama model di CONTEXT.md atau SKILL.md — gunakan capability type

---
*Omega v1.0 · 2026-09-23*
