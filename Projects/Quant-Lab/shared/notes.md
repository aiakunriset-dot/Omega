# shared/ — Cross-Stage Notes (Quant-Lab)

This folder contains mutable cross-stage notes — they change as work progresses.
Unlike `_shared/`, it contains stable configuration (rules, conventions).

## What belongs here

- **decisions.md** — Design decisions that have been made and their reasons
- **backlog.md** — Strategy ideas not mature enough for strategies.md
- **glossary.md** — Technical terms used in this project

## What does NOT belong here

- Stable rules → put them in `_shared/rules.md`
- Technical conventions → put them in `_shared/conventions.md`
- Strategy catalog → put it in `_shared/strategies.md`
- Error log → put it in `_shared/errors.md`

---

## decisions.md (inline — use a separate file if it grows large)

### Decisions made

<!-- Add when an important decision needs to be recorded -->
<!-- Format:
### [YYYY-MM-DD] [Topik keputusan]
- **Context:** why this decision was needed
- **Decision:** what was decided
- **Alternatives considered:** what was not chosen
- **Reason:** why this option was chosen
-->

---

## backlog.md (inline)

### Immature Strategy Ideas

<!-- Interesting strategies that are not ready for research -->
<!-- When mature: move to _shared/strategies.md with status: idea -->

---

## glossary.md (inline)

### Quant-Lab Technical Terms

| Term | Definition |
|---------|----------|
| OOS | Out-of-sample — data not used for fitting |
| WF | Walk-forward — validation method with a rolling window |
| Sharpe | Excess return per unit risk (target ≥ 1.0 per conventions) |
| MDD | Maximum Drawdown — largest decline from peak to trough |
| CAGR | Compound Annual Growth Rate |

<!-- Add new terms when they first appear in a document -->
