# Provider Map — Capability Routing

Semua AI calls melewati OmniRoute (localhost:20128).
CONTEXT.md dan SKILL.md menyebut capability type saja.
OmniRoute yang memutuskan provider dan model konkret.

## Capability Types

| Capability | Deskripsi | Gunakan untuk |
|------------|-----------|---------------|
| `reasoning-high` | Reasoning mendalam, judgment kompleks | Consensus, review strategis |
| `coding-fast` | Coding volume tinggi, efisien | Developer stage, file writing |
| `research-long` | Context sangat panjang, web grounding | Research stage, literature review |
| `math-stats` | Presisi matematis, validasi statistik | Audit stage, backtest validation |
| `general` | Kemampuan seimbang | Default, task tidak spesifik |

## Cara Referensi di CONTEXT.md

```markdown
## Capability required
`reasoning-high`
```

## OmniRoute Gateway

```
Gateway:  http://localhost:20128 (OpenAI-compatible API)
Install:  npm install -g omniroute && omniroute
Docs:     localhost:20128/dashboard setelah install
Secrets:  Lihat _shared\secrets.template (JANGAN commit API keys)
```

## Provider Assignments (V1.0 — PLACEHOLDER)

Belum dikonfigurasi. Update file ini saat OmniRoute aktif (V1.2).

| Capability | Provider | Notes |
|------------|----------|-------|
| `reasoning-high` | [pending] | |
| `coding-fast` | [pending] | |
| `research-long` | [pending] | |
| `math-stats` | [pending] | |
| `general` | [pending] | |

## Cara Ganti Provider

1. Edit tabel di atas — ubah kolom Provider
2. Reconfigure OmniRoute untuk routing baru
3. Tidak ada file lain yang perlu diubah
4. Commit: `git commit -m "providers: switch [X] capability to [Y]"`

## Fallback Strategy (saat provider utama down)

```
reasoning-high → general (degraded)
coding-fast    → general (degraded)
research-long  → reasoning-high (reduced context)
math-stats     → reasoning-high (reduced precision)
general        → [manual — notify human]
```
