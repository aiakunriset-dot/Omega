# Omega Version

Omega v1.1
Released: 2026-09-23
Schema: L0/L1/L2/L3/L4

## Workspace Validation

```powershell
# Install icm CLI (sekali saja)
pip install icm-workspace-template

# Validasi struktur Omega
icm validate .\Projects\Quant-Lab --strict

# Expected output:
# OK: workspace passed validation with 0 warning(s)
```

## Bump version if
- Folder structure fundamentally changes (L0–L4 hierarchy reorganized)
- CONTEXT.md contract format changes in breaking way
- rules.md invariants change in breaking way

## DO NOT bump for
- File content edits
- New stages added to a project
- New providers added to routing
- New projects added
- New skills added

## Version history

| Version | Date | Description |
|---------|------|-------------|
| v1.1 | 2026-09-25 | Refinement based on M5-M6 usage: explicit revision and handoff gates. |
| v1.0 | 2026-09-23 | Initial structure. Pure markdown + icm CLI validation. |

## Compatibility check (AI instruction)

If the structure you see does not match `Schema: L0/L1/L2/L3/L4`,
or if `_migrations/` contains content,
**stop and notify the human before proceeding.**

Run `icm validate --strict` if there is any doubt about the structure.
