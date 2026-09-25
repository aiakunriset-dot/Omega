# Migrations

Forward-compatibility hook. Kosong di V1.0.

## Purpose

Ketika struktur Omega berubah secara fundamental (version bump),
skrip migrasi untuk menerapkan perubahan tersebut hidup di sini.

## Convention

Setiap migrasi adalah folder: `V{n}-to-V{n+1}/`

Isi folder:
- `README.md` — apa yang berubah dan mengapa
- `migrate.ps1` — menerapkan perubahan (Windows PowerShell)
- `rollback.ps1` — membatalkan perubahan

## AI Instruction

Saat masuk ke Omega, jika ada folder migrasi di sini:

1. Cek versi di `_version.md`
2. Jika ada folder migrasi yang target versinya lebih tinggi dari versi saat ini
3. **STOP** — notifikasi human, jangan auto-migrate
4. Tunggu instruksi human sebelum melanjutkan

## Status V1.0

Tidak ada migrasi. Folder pertama akan dibuat saat V1 → V2.
