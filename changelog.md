# Omega Changelog

Append-only log of structural changes. **Newest entry at top.**

## Format
```
## [YYYY-MM-DD] vX.X — Short description
- Changed: what changed
- Reason: why it changed
- Impact: which folders/files affected
```

## [2026-09-25] v1.2 — OmniRoute MCP connected
- MCP server: omniroute (110 tools, stdio transport)
- Location: Local scope, project C:\Omega
- Config: C:\Users\Administrator\.claude.json
- Status: connected

## [2026-09-25] v1.1 — Refinement based on M5-M6 usage
- Changed: Added an explicit research-brief revision workflow after human rejection
- Changed: Clarified development prerequisites and approval handoff requirements
- Changed: Documented Git repository setup as a prerequisite for snapshots and commits
- Reason: M5 and M6 exposed ambiguity around rejected briefs, approval files, and Git availability
- Impact: `01_research/CONTEXT.md`, `02_development/CONTEXT.md`, `_tools.md`, and `_version.md`

---

## [2026-09-23] v1.0 — Initial structure + icm CLI integration
- Changed: Full Omega structure created from scratch
- Changed: icm-workspace-template CLI integrated (icm validate, icm dashboard, icm accept)
- Changed: Quant-Lab pipeline: 4 stages with full contracts
- Changed: _tools.md added with complete setup guide
- Changed: shared/ (mutable notes) added alongside _shared/ (stable config)
- Changed: 03_audit/references/review-rubric.md added for icm review
- Changed: secrets.template added
- Changed: .gitignore added
- Reason: Foundation setup — replacing web chat workflow
- Impact: All folders and files per v1.0 blueprint
