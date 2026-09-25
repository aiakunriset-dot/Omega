# Translation Rules

## Priority order
1. Structure preservation > literal translation
2. Technical accuracy > natural phrasing
3. Consistency with existing English files > stylistic preference

## Section-by-section guidance

### Headings
- `## Tujuan` → `## Purpose`
- `## Cara Kerja` → `## How it works`
- `## Aturan` → `## Rules`
- `## Proses` → `## Process`
- `## Output` → `## Output`
- `## Verifikasi` → `## Verification`
- `## Catatan` → `## Notes`
- Keep English headings unchanged: Inputs, Outputs, Human check, Fail behavior

### Tables
- Column headers: translate
- Cell content: translate only if prose
- Status values: keep as-is
- File paths in cells: keep as-is

### Lists
- Translate text
- Keep numbered/bulleted structure
- Keep nested levels

### Frontmatter
- Keys: never translate
- `description:` value: translate to English
- `name:` value: keep as-is

### Code blocks
- NEVER translate
- Including comments inside code blocks
- Exception: if comment is a markdown comment `<!-- -->` outside code, translate

## Tone guidelines
- Formal, terse, direct
- No padding words ("actually", "really", "just")
- Imperative mood for instructions ("Read", "Check", "Write")
- Present tense for descriptions

## Common Indonesian → English mappings
See `glossary.md` for full list.

## Edge cases
| Situation | Action |
|---|---|
| Mixed sentence (ID + EN) | Translate ID portion, keep EN |
| Technical term in ID | Look up in glossary; if not found, keep ID |
| Proper noun | Keep as-is |
| Acronym | Keep as-is, expand only if consistent with existing usage |
| Code comment in ID | Keep ID if inside code block |
| URL or path | Keep as-is |
| Emoji | Keep |