# 01_research — Evaluate tools, methodologies, versions

## One job
Produce evaluation report for a specific tool or change.

## Inputs
- Working (this run): ../_shared/tools.md
- Reference (every run): ../../_shared/providers.md

## Process
1. Pick one tool/change from research queue.
2. Research: how it works, Windows compatibility, token cost, integration effort.
3. Compare against alternatives.
4. State recommendation: adopt, defer, or reject.
5. List 3 risks or unknowns.

## Outputs
- evaluation-YYYY-MM-DD-{topic}.md → output/
- Format: Summary / How it works / Compat / Cost / Effort / Recommendation / Risks

## Human check
Read the evaluation. Is the recommendation justified?

## Fail behavior
If inconclusive, write evaluation-YYYY-MM-DD-inconclusive.md and stop.
