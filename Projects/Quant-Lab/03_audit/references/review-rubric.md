# Review Rubric — 03_audit

This rubric is used by `icm review stages/03_audit` to validate
`audit-report.md` deterministically before the human check.

## Required Sections

audit-report.md must contain all of the following sections:

```
required_sections:
  - "## Verdict"
  - "## Metrics (Out-of-Sample)"
  - "## Backtest Configuration"
  - "## Walk-Forward Results"
  - "## Stress Tests"
  - "## Issues Found"
```

## Required Terms

audit-report.md must contain one of:

```
required_terms_any:
  - "**PASS**"
  - "**FAIL**"
```

## Required Table Columns (Metrics table)

The metrics table must have these columns:

```
required_table_columns:
  - "Metric"
  - "Value"
  - "Threshold"
  - "Status"
```

## Forbidden Placeholders

audit-report.md must not contain:

```
forbidden_placeholders:
  - "[TBD]"
  - "[FILL IN]"
  - "[TODO]"
  - "X.XX"
  - "XX.X%"
```

## Minimum Metrics Count

The Metrics table must have at least 6 rows (6 metrics):

```
minimum_table_rows:
  table: "## Metrics (Out-of-Sample)"
  min_rows: 6
```

## Threshold Validation

Every row in the Metrics table with Status = FAIL must cause a FAIL verdict.
If any Status = FAIL exists, Verdict must = FAIL (not PASS).

```
cross_check:
  - if: "FAIL" in metrics_status_column
    then: verdict must contain "**FAIL**"
```

## Source Traceability

audit-report.md must reference:

```
required_references:
  - "../02_development/output/"
  - "../01_research/output/research-brief.md"
```

---

*Review rubric for stage 03_audit · Omega v1.0*
*Use: `icm review stages/03_audit --workspace C:\Omega\Projects\Quant-Lab`*
