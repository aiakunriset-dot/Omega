# Tools — Setup Guide

All tools required by Omega. Install in this order.

## BLOCK 1 — Prerequisites (Install Once)

```powershell
# Python 3.10+ (required for icm CLI)
winget install Python.Python.3.12

# Git
winget install Git.Git

# Node.js (for OmniRoute and skills)
winget install OpenJS.NodeJS.LTS

# VS Code
winget install Microsoft.VisualStudioCode
```

## BLOCK 2 — ICM CLI (Most Important)

Before creating a snapshot or commit, verify that `C:\Omega` is a Git repository.
If `.git` is missing, initialize or clone the repository before using the backup
and commit commands below.

```powershell
# Install icm-workspace-template
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install icm-workspace-template

# Verifikasi
icm --version
```

Commands available after installation:

| Command | Function |
|----------|--------|
| `icm validate C:\Omega\Projects\Quant-Lab --strict` | Validasi struktur workspace |
| `icm status C:\Omega\Projects\Quant-Lab` | Lihat status semua stage |
| `icm next C:\Omega\Projects\Quant-Lab` | Which stage should be worked on next |
| `icm review stages\01_research --workspace C:\Omega\Projects\Quant-Lab` | Review output stage |
| `icm accept stages\01_research --workspace C:\Omega\Projects\Quant-Lab --reviewer [name] --note "[notes]"` | Record human approval |
| `icm dashboard C:\Omega\Projects\Quant-Lab` | Open the local dashboard in a browser |
| `icm doctor C:\Omega\Projects\Quant-Lab` | Diagnosa masalah struktur |

**`icm dashboard` is the Omega dashboard.** No custom dashboard is needed.

## BLOCK 3 — Claude Code (AI Runtime)

```powershell
npm install -g @anthropic-ai/claude-code
claude --version
```

Install the icm-architect skill:
```powershell
npx skills add RinDig/icm-architect
# atau manual:
# git clone https://github.com/RinDig/icm-architect.git
# cp -r icm-architect ~/.claude/skills/icm-architect
```

Install Omega skills:
```powershell
npx skills add forrestchang/andrej-karpathy-skills
npx skills add ayghri/i-have-adhd
npx skills add DietrichGebert/ponytail
```

## BLOCK 4 — OmniRoute (AI Gateway)

```powershell
npm install -g omniroute
omniroute
# Dashboard: http://localhost:20128
```

Configuration: see `_shared\providers.md` and `_shared\secrets.template`

## BLOCK 5 — Omega Verification

```powershell
cd C:\Omega

# Validate structure
icm validate .\Projects\Quant-Lab --strict

# View status
icm status .\Projects\Quant-Lab

# Open dashboard
icm dashboard .\Projects\Quant-Lab

# Manual walk test (validation backup)
# Open CLAUDE.md — can you orient yourself in 2 reads?
```

Expected output validasi:
```
OK: workspace passed validation with 0 warning(s)
```

## Tool Status (V1.0)

| Tool | Status | Needed for |
|------|--------|-----------------|
| Python 3.12 | required now | icm CLI |
| icm-workspace-template | required now | dashboard, validation, review |
| Claude Code | required now | AI runtime |
| VS Code | required now | editor |
| Git | required now | backup |
| OmniRoute | V1.2 | multi-provider routing |
| icm-architect skill | V1.1 | new project setup |
| Karpathy/ponytail skills | V1.1 | coding discipline |

---
*tools.md created: 2026-09-23 · Update when a new tool is added*
