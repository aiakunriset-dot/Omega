# Provider Map — Capability Routing

All AI calls pass through OmniRoute (localhost:20128).
CONTEXT.md and SKILL.md reference capability types only.
OmniRoute decides the concrete provider and model.

## Capability Types

| Capability | Description | Use for |
|------------|-----------|---------------|
| `reasoning-high` | Deep reasoning, complex judgment | Consensus, strategic review |
| `coding-fast` | High-volume, efficient coding | Developer stage, file writing |
| `research-long` | Very long context, web grounding | Research stage, literature review |
| `math-stats` | Mathematical precision, statistical validation | Audit stage, backtest validation |
| `general` | Balanced capability | Default, unspecified tasks |

## Referencing in CONTEXT.md

```markdown
## Capability required
`reasoning-high`
```

## OmniRoute Gateway

```
Gateway:  http://localhost:20128 (OpenAI-compatible API)
Install:  npm install -g omniroute && omniroute
Docs:     localhost:20128/dashboard after installation
Secrets:  See _shared\secrets.template (DO NOT commit API keys)
```

## Provider Assignments (V1.0)

| Capability | Primary | Fallback |
|------------|---------|----------|
| `reasoning-high` | `auto/reasoning` | `claude-opus` |
| `long-context` | `auto/long-context` | `gemini-pro` |
| `coding-fast` | `auto/coding` | `deepseek-chat` |
| `creative` | `auto/creative` | `gpt-4o` |
| `research-long` | `auto/research` | `gemini-pro` |
| `math-stats` | `auto/reasoning` | `claude-sonnet` |

## Changing Providers

1. Edit the table above — change the Provider column
2. Reconfigure OmniRoute for the new routing
3. No other files need to be changed
4. Commit: `git commit -m "providers: switch [X] capability to [Y]"`

## Fallback Strategy (when the primary provider is down)

```
reasoning-high → general (degraded)
coding-fast    → general (degraded)
research-long  → reasoning-high (reduced context)
math-stats     → reasoning-high (reduced precision)
general        → [manual — notify human]
```
