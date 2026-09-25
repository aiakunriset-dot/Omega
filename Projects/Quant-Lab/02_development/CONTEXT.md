# CONTEXT.md — L2 Stage Contract (02_development/)

## One job

Produce `strategy.py` implementing the strategy exactly as defined in
`research-brief.md`, complete with a test file and ready for stage 03_audit
to run without modification.

## Prerequisite check

Before starting, verify:
- `../01_research/output/research-brief.md` exists ✓
- `../01_research/output/approved-research-YYYY-MM-DD.md` exists ✓

If either is missing, stop. Return to stage 01_research.

The research brief is not approved until a file matching
`../01_research/output/approved-research-YYYY-MM-DD.md` exists. A brief with
`Status: awaiting-approval` or a rejected human review is not sufficient.

## Inputs

**Working** (per run):
- `../01_research/output/research-brief.md` — complete strategy specification

**Reference** (stable):
- `../_shared/conventions.md` — Python conventions, library stack, naming
- `../../_shared/rules.md` — global rules

## Process

1. Read `research-brief.md` in full — understand entry, exit, parameters, and risk
2. Scaffold `output/[strategy-name].py` using the structure below
3. Implement the entry signal according to the specification — no free interpretation
4. Implement the exit signal and risk management
5. Add type hints to all function signatures (required by conventions)
6. Write `output/test_[strategy-name].py` with at least 5 test cases
7. Ensure there is no global state and no hardcoded path
8. Self-review: can every code line be traced to the brief specification?

## Output format: strategy.py

```python
"""
Strategy: [strategy-name]
Brief: ../01_research/output/research-brief.md
Date: YYYY-MM-DD
Author: Omega Quant-Lab

Description:
    [One paragraph from the hypothesis in research-brief]
"""

from typing import ...
import pandas as pd
import numpy as np

# Constants (from parameters in the brief)
PARAM_NAME: float = value  # with unit and range comment

def compute_signals(data: pd.DataFrame) -> pd.Series:
    """
    Entry/exit signals per brief section 'Entry Signal'.
    Returns: pd.Series of {1: long, -1: short, 0: flat}
    """
    ...

def apply_risk_management(signals: pd.Series, data: pd.DataFrame) -> pd.DataFrame:
    """
    Position sizing and stop loss according to the brief's 'Risk Management' section.
    """
    ...

def run_strategy(data: pd.DataFrame) -> pd.DataFrame:
    """
    Main entry point for the backtester in stage 03_audit.
    Returns: DataFrame with columns [signal, position, returns]
    """
    ...
```

## Outputs

| File | Description |
|------|-----------|
| `output/[strategy-name].py` | Strategy implementation |
| `output/test_[strategy-name].py` | Test file (min 5 tests) |
| `output/question-YYYY-MM-DD.md` | If the brief is ambiguous |

## Capability required

`coding-fast` — see `../../_shared/providers.md`

## Human check

Before stage 03_audit begins:
1. Read `strategy.py` — do entry/exit match the brief?
2. Run `pytest output/test_[strategy-name].py` — do all tests pass?
3. Check for lookahead bias (future data used for past signals)
4. Check for global state or hardcoded paths
5. If approved, create `output/approved-development-YYYY-MM-DD.md`:
   ```
   Approved by: [name]
   Date: YYYY-MM-DD
   Tests: [N]/[N] passed
   Lookahead check: clean
   Ready for: audit
   ```

Do not create the development approval file until all tests pass and the human
has reviewed the implementation and lookahead check.

## Fail behavior

- If research-brief.md is ambiguous or contradictory:
  → Do not guess. Write the ambiguity to `output/question-YYYY-MM-DD.md`
  → Stop. Return to stage 01_research with specific questions.

- If the code cannot compile or a test fails:
  → Log the error to `../../_shared/errors.md` (using R1 format)
  → Keep the partial code — do not delete it
  → Try to fix it for at most 2 iterations before escalating to the human

- If there is a fundamental mismatch between the brief and a possible implementation:
  → Write `output/question-YYYY-MM-DD.md` explaining the limitation
  → Stop. The human decides whether to revise the brief or find an alternative.

- **Do not merge code forward if tests have not passed.**
- **Do not delete old files without a backup.**
