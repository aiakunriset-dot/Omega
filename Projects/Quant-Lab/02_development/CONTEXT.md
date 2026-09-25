# CONTEXT.md — L2 Stage Contract (02_development/)

## One job

Menghasilkan `strategy.py` yang mengimplementasikan strategi persis seperti yang
didefinisikan di `research-brief.md`, lengkap dengan test file, siap dijalankan
oleh stage 03_audit tanpa modifikasi.

## Prerequisite check

Sebelum mulai, verifikasi:
- `../01_research/output/research-brief.md` ada ✓
- `../01_research/output/approved-research-YYYY-MM-DD.md` ada ✓

Jika salah satu tidak ada → stop. Kembali ke stage 01_research.

## Inputs

**Working** (per run):
- `../01_research/output/research-brief.md` — spesifikasi lengkap strategi

**Reference** (stabil):
- `../_shared/conventions.md` — Python conventions, library stack, naming
- `../../_shared/rules.md` — global rules

## Process

1. Baca `research-brief.md` seluruhnya — pahami entry, exit, parameters, risk
2. Scaffold file `output/[strategy-name].py` dengan struktur di bawah
3. Implementasikan entry signal sesuai spesifikasi — tidak ada interpretasi bebas
4. Implementasikan exit signal dan risk management
5. Tambahkan type hints di semua function signatures (wajib per conventions)
6. Tulis `output/test_[strategy-name].py` dengan minimal 5 test cases
7. Pastikan tidak ada global state, tidak ada hardcoded path
8. Self-review: apakah setiap baris kode bisa ditelusuri ke spesifikasi di brief?

## Output format: strategy.py

```python
"""
Strategy: [nama-strategi]
Brief: ../01_research/output/research-brief.md
Date: YYYY-MM-DD
Author: Omega Quant-Lab

Description:
    [Satu paragraf dari hypothesis di research-brief]
"""

from typing import ...
import pandas as pd
import numpy as np

# Constants (dari parameters di brief)
PARAM_NAME: float = value  # dengan unit dan range comment

def compute_signals(data: pd.DataFrame) -> pd.Series:
    """
    Entry/exit signals sesuai brief section 'Entry Signal'.
    Returns: pd.Series of {1: long, -1: short, 0: flat}
    """
    ...

def apply_risk_management(signals: pd.Series, data: pd.DataFrame) -> pd.DataFrame:
    """
    Position sizing dan stop loss sesuai brief section 'Risk Management'.
    """
    ...

def run_strategy(data: pd.DataFrame) -> pd.DataFrame:
    """
    Main entry point untuk backtester di stage 03_audit.
    Returns: DataFrame dengan columns [signal, position, returns]
    """
    ...
```

## Outputs

| File | Deskripsi |
|------|-----------|
| `output/[strategy-name].py` | Implementasi strategi |
| `output/test_[strategy-name].py` | Test file (min 5 tests) |
| `output/question-YYYY-MM-DD.md` | Jika ada ambiguitas di brief |

## Capability required

`coding-fast` — lihat `../../_shared/providers.md`

## Human check

Sebelum stage 03_audit dimulai:
1. Baca `strategy.py` — apakah entry/exit sesuai brief?
2. Jalankan `pytest output/test_[strategy-name].py` — semua test pass?
3. Cek: ada lookahead bias (future data dipakai untuk signal masa lalu)?
4. Cek: ada global state atau hardcoded path?
5. Jika setuju → buat `output/approved-development-YYYY-MM-DD.md`:
   ```
   Approved by: [nama]
   Date: YYYY-MM-DD
   Tests: [N]/[N] passed
   Lookahead check: clean
   Ready for: audit
   ```

## Fail behavior

- Jika research-brief.md ambigu atau kontradiktif:
  → Jangan tebak. Tulis ambiguitas ke `output/question-YYYY-MM-DD.md`
  → Stop. Kembali ke stage 01_research dengan pertanyaan spesifik.

- Jika kode tidak bisa dikompilasi atau test gagal:
  → Log error ke `../../_shared/errors.md` (dengan format R1)
  → Simpan kode parsial — jangan hapus
  → Coba perbaiki maksimal 2 iterasi sebelum eskalasi ke human

- Jika ada ketidakcocokan fundamental antara brief dan implementasi yang mungkin:
  → Tulis `output/question-YYYY-MM-DD.md` dengan penjelasan keterbatasan
  → Stop. Human putuskan: revisi brief atau cari pendekatan alternatif.

- **Tidak ada kode yang di-merge forward jika test belum pass.**
- **Tidak ada penghapusan file lama tanpa backup.**
