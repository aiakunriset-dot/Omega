# Error Journal — Global

Error log across projects. The next AI must read this before starting.

## Required format (see rules.md R1)

```markdown
### Error: [short description]
- **Context:** what was being worked on
- **Symptom:** what was observed
- **Root cause:** why (or "unknown — investigation needed")
- **Fix:** what resolved it (or "pending")
- **Date:** YYYY-MM-DD
```

## Rules

- AI drafts → human approves → then append
- Entries must not be deleted (append-only)
- Project-specific errors → record them in `Projects\[nama]\_shared\errors.md`
- Errors likely to recur across projects → record them here

---

<!-- Errors will be added based on actual use. Empty in V1.0. -->

### Error: Python failed to create the Omega virtual environment
- **Context:** Running Omega tool setup and creating C:\Omega\.venv
- **Symptom:** Fatal Python error: Failed to import encodings module
- **Root cause:** PYTHONHOME pointed to an incomplete Python314 installation different from the active interpreter at C:\Python314
- **Fix:** Use the correct Python configuration or remove the incorrect PYTHONHOME, then recreate the virtual environment
- **Date:** 2026-09-25
