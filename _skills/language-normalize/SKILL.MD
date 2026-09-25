---
name: language-normalize
description: Normalize all markdown files in Omega to English-only. Use when files contain mixed Indonesian/English content, or when the user asks to "clean up language", "make English", "normalize MD files", or "translate to English". Preserves code blocks, paths, technical terms, and structure.
---

# Language Normalize — English-Only MD Files

## Purpose
Convert mixed-language markdown files in Omega to consistent English.
AI models process English more efficiently and consistently.

## Scope
- Target: all `.md` files under `C:\Omega\`
- Exception: files in `_backups\`, `_migrations\` (leave as-is unless explicitly asked)

## What to translate
- Prose paragraphs
- Headings (if Indonesian)
- List items written in prose
- Table headers and cells with prose
- Comments inside markdown (not code)
- Frontmatter description fields

## What NOT to translate
- **Code blocks** (` ``` ` fenced or inline)
- **File paths** (`C:\Omega\...`, `_shared/rules.md`)
- **Command lines** (PowerShell, bash, npm, git)
- **Technical terms** already in English (e.g., "stage", "pipeline", "MCP", "provider")
- **Proper nouns** (Omega, Quant-Lab, OmniRoute, Claude Code, VS Code)
- **Status values** in tables (e.g., `idea`, `in-research`, `passed`)
- **Keys in YAML frontmatter** (only values may need translation)
- **Wikilinks** (`[[...]]`) and markdown links
- **Section names that are already English conventions** (`## Inputs`, `## Process`, `## Outputs`)

## Rules
1. Preserve file structure exactly — headings, sections, order
2. Preserve all code blocks verbatim
3. Preserve all markdown formatting (bold, italic, links, tables)
4. Preserve date formats and numbers
5. Translate meaning, not word-for-word
6. Keep tone consistent with existing English files (formal, terse, direct)
7. Do NOT add or remove sections
8. Do NOT "improve" content beyond translation
9. If a term is ambiguous, use `glossary.md`
10. If a file is already 100% English, skip it

## Process
1. Run `script\scan.ps1` to find mixed-language files
2. For each file:
   a. Read entire file
   b. Identify Indonesian segments
   c. Translate using rules above
   d. Write back the file (in-place edit, preserving structure)
   e. Log the change in `changelog.md`
3. After batch complete: run walk test
4. Commit to git with message: `lang: normalize {N} files to English`

## Fail behavior
- If a file's meaning would change by translation: skip, log to `_shared/errors.md`
- If a technical term has no clear English equivalent: keep Indonesian, add `<!-- EN: ... -->` comment
- Never translate a code block, even partially

## Output
- Updated `.md` files in English
- Entry in `C:\Omega\changelog.md`
- If errors: entry in `C:\Omega\_shared\errors.md`