# Tools — Setup Guide

Semua tools yang dibutuhkan Omega. Install dalam urutan ini.

## BLOK 1 — Prerequisites (Install Sekali)

```powershell
# Python 3.10+ (wajib untuk icm CLI)
winget install Python.Python.3.12

# Git
winget install Git.Git

# Node.js (untuk OmniRoute dan skills)
winget install OpenJS.NodeJS.LTS

# VS Code
winget install Microsoft.VisualStudioCode
```

## BLOK 2 — ICM CLI (Paling Penting)

```powershell
# Install icm-workspace-template
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install icm-workspace-template

# Verifikasi
icm --version
```

Perintah yang tersedia setelah install:

| Perintah | Fungsi |
|----------|--------|
| `icm validate C:\Omega\Projects\Quant-Lab --strict` | Validasi struktur workspace |
| `icm status C:\Omega\Projects\Quant-Lab` | Lihat status semua stage |
| `icm next C:\Omega\Projects\Quant-Lab` | Stage apa yang harus dikerjakan berikutnya |
| `icm review stages\01_research --workspace C:\Omega\Projects\Quant-Lab` | Review output stage |
| `icm accept stages\01_research --workspace C:\Omega\Projects\Quant-Lab --reviewer [nama] --note "[catatan]"` | Record human approval |
| `icm dashboard C:\Omega\Projects\Quant-Lab` | Buka local dashboard di browser |
| `icm doctor C:\Omega\Projects\Quant-Lab` | Diagnosa masalah struktur |

**`icm dashboard` adalah dashboard Omega.** Tidak perlu membangun dashboard custom.

## BLOK 3 — Claude Code (AI Runtime)

```powershell
npm install -g @anthropic-ai/claude-code
claude --version
```

Install skill icm-architect:
```powershell
npx skills add RinDig/icm-architect
# atau manual:
# git clone https://github.com/RinDig/icm-architect.git
# cp -r icm-architect ~/.claude/skills/icm-architect
```

Install skills Omega:
```powershell
npx skills add forrestchang/andrej-karpathy-skills
npx skills add ayghri/i-have-adhd
npx skills add DietrichGebert/ponytail
```

## BLOK 4 — OmniRoute (AI Gateway)

```powershell
npm install -g omniroute
omniroute
# Dashboard: http://localhost:20128
```

Konfigurasi: lihat `_shared\providers.md` dan `_shared\secrets.template`

## BLOK 5 — Verifikasi Omega

```powershell
cd C:\Omega

# Validasi struktur
icm validate .\Projects\Quant-Lab --strict

# Lihat status
icm status .\Projects\Quant-Lab

# Buka dashboard
icm dashboard .\Projects\Quant-Lab

# Walk test manual (backup untuk validasi)
# Buka CLAUDE.md — bisa orientasi dalam 2 read?
```

Expected output validasi:
```
OK: workspace passed validation with 0 warning(s)
```

## Status Tools (V1.0)

| Tool | Status | Dibutuhkan untuk |
|------|--------|-----------------|
| Python 3.12 | wajib sekarang | icm CLI |
| icm-workspace-template | wajib sekarang | dashboard, validation, review |
| Claude Code | wajib sekarang | AI runtime |
| VS Code | wajib sekarang | editor |
| Git | wajib sekarang | backup |
| OmniRoute | V1.2 | multi-provider routing |
| icm-architect skill | V1.1 | new project setup |
| Karpathy/ponytail skills | V1.1 | coding discipline |

---
*tools.md dibuat: 2026-09-23 · Update saat ada tool baru*
