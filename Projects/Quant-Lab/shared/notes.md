# shared/ — Cross-Stage Notes (Quant-Lab)

Folder ini berisi catatan lintas stage yang bersifat mutable — berubah seiring pekerjaan.
Berbeda dari `_shared/` yang berisi stable configuration (rules, conventions).

## Apa yang masuk di sini

- **decisions.md** — Keputusan desain yang pernah dibuat dan alasannya
- **backlog.md** — Ide strategi yang belum cukup matang untuk dimasukkan ke strategies.md
- **glossary.md** — Istilah teknis yang digunakan di proyek ini

## Apa yang TIDAK masuk di sini

- Aturan stabil → masuk `_shared/rules.md`
- Konvensi teknis → masuk `_shared/conventions.md`
- Katalog strategi → masuk `_shared/strategies.md`
- Error log → masuk `_shared/errors.md`

---

## decisions.md (inline — gunakan file terpisah jika tumbuh besar)

### Keputusan yang pernah dibuat

<!-- Tambahkan saat ada keputusan penting yang perlu dicatat -->
<!-- Format:
### [YYYY-MM-DD] [Topik keputusan]
- **Context:** mengapa keputusan ini perlu dibuat
- **Decision:** apa yang diputuskan
- **Alternatives considered:** apa yang tidak dipilih
- **Reason:** mengapa pilihan ini
-->

---

## backlog.md (inline)

### Ide Strategi yang Belum Matang

<!-- Strategi yang menarik tapi belum cukup untuk di-research -->
<!-- Ketika sudah matang: pindah ke _shared/strategies.md dengan status: idea -->

---

## glossary.md (inline)

### Istilah Teknis Quant-Lab

| Istilah | Definisi |
|---------|----------|
| OOS | Out-of-sample — data yang tidak dipakai untuk fitting |
| WF | Walk-forward — metode validasi dengan rolling window |
| Sharpe | Excess return per unit risk (target ≥ 1.0 per conventions) |
| MDD | Maximum Drawdown — penurunan terbesar dari peak ke trough |
| CAGR | Compound Annual Growth Rate |

<!-- Tambahkan istilah baru saat pertama kali muncul di dokumen -->
