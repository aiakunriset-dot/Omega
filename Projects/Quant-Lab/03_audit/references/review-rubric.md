# Review Rubric — 03_audit

Rubric ini digunakan oleh `icm review stages/03_audit` untuk memvalidasi
`audit-report.md` secara deterministik sebelum human check.

## Required Sections

audit-report.md harus berisi semua section berikut:

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

audit-report.md harus mengandung salah satu:

```
required_terms_any:
  - "**PASS**"
  - "**FAIL**"
```

## Required Table Columns (Metrics table)

Tabel metrics harus memiliki kolom:

```
required_table_columns:
  - "Metrik"
  - "Nilai"
  - "Threshold"
  - "Status"
```

## Forbidden Placeholders

audit-report.md tidak boleh mengandung:

```
forbidden_placeholders:
  - "[TBD]"
  - "[FILL IN]"
  - "[TODO]"
  - "X.XX"
  - "XX.X%"
```

## Minimum Metrics Count

Tabel Metrics harus memiliki minimal 6 baris (6 metrik):

```
minimum_table_rows:
  table: "## Metrics (Out-of-Sample)"
  min_rows: 6
```

## Threshold Validation

Setiap row di tabel Metrics dengan Status = FAIL harus menyebabkan verdict FAIL.
Jika ada satu pun Status = FAIL, maka Verdict harus = FAIL (bukan PASS).

```
cross_check:
  - if: "FAIL" in metrics_status_column
    then: verdict must contain "**FAIL**"
```

## Source Traceability

audit-report.md harus mereferensikan:

```
required_references:
  - "../02_development/output/"
  - "../01_research/output/research-brief.md"
```

---

*Review rubric untuk stage 03_audit · Omega v1.0*
*Gunakan: `icm review stages/03_audit --workspace C:\Omega\Projects\Quant-Lab`*
