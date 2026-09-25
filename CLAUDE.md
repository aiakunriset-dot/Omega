# C:\Omega\ — Entry Point

You are at the Omega root. Read this table, then go to the appropriate destination.
Read `_version.md` first to confirm compatibility.

## Orientasi Cepat

| I want to... | Go to |
|---------------|----------|
| Work on an active project | `Projects\[nama]\CLAUDE.md` |
| Create a new project | Copy `_templates\` → `Projects\[nama]\`, read `_shared\rules.md` |
| View global rules | `_shared\rules.md` |
| Select model / provider | `_shared\providers.md` |
| Set up tools | `_tools.md` |
| Review past errors | `_shared\errors.md` |
| Review proven patterns | `_shared\patterns.md` |
| Omega version | `_version.md` |

## Active Projects

| Project | Folder | Description |
|--------|--------|-----------|
| Quant-Lab | `Projects\Quant-Lab\` | Trading strategy research & development |

## Omega Commands (run from the project folder)

```powershell
# Status semua stage
icm status .\Projects\Quant-Lab

# Stage berikutnya
icm next .\Projects\Quant-Lab

# Dashboard (open in browser)
icm dashboard .\Projects\Quant-Lab

# Validasi struktur
icm validate .\Projects\Quant-Lab --strict

# Review stage output before approval
icm review stages\01_research --workspace .\Projects\Quant-Lab

# Record human approval
icm accept stages\01_research --workspace .\Projects\Quant-Lab --reviewer [nama] --note "[catatan]"
```

## Absolute Rules

1. Read the stage `CONTEXT.md` before doing anything
2. Write output ONLY to the active stage's `output\`
3. Nothing may be deleted without first logging it in `_shared\errors.md`
4. Changes to `_shared\` require explicit human approval
5. Do not use model names in CONTEXT.md or SKILL.md — use capability types

---
*Omega v1.0 · 2026-09-23*
