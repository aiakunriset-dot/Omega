# Global Rules — Never Violate

Berlaku untuk semua AI, semua proyek, semua sesi.
Aturan ditambah dari pengalaman nyata, bukan dirancang dari nol.

---

## R1 — Log Before Fix (Operational)

Setiap error WAJIB dicatat di `_shared\errors.md` sebelum diperbaiki.

**Prosedur operasional:**

**Step 1:** AI menyusun draft entry dengan format ini:
```
### Error: [deskripsi singkat]
- **Context:** sedang mengerjakan apa
- **Symptom:** apa yang terlihat
- **Root cause:** mengapa (atau "unknown — perlu investigasi")
- **Fix:** apa yang menyelesaikannya (atau "pending")
- **Date:** YYYY-MM-DD
```

**Step 2:** AI menampilkan draft ke human dalam chat/terminal.

**Step 3:** Human mereview dan menyetujui atau mengedit.

**Step 4:** Setelah disetujui, entry di-append ke:
- `_shared\errors.md` (level Omega), ATAU
- `Projects\[nama]\_shared\errors.md` (level proyek)

**Step 5:** Baru setelah logging boleh mulai fix.

**Siapa yang menulis:** AI drafts, human approves. Tidak ada silent write. Tidak ada format ad-hoc.

---

## R2 — Write Gate

Tidak ada file yang dimodifikasi di `04_production\output\` atau `_shared\`
tanpa pernyataan eksplisit dari manusia dalam sesi yang sama.

Bukan asumsi. Bukan inferensi. Pernyataan eksplisit.

---

## R3 — One Home Per Fact

Setiap fakta, aturan, atau keputusan tersimpan di SATU tempat.
Jika butuh di tempat lain — buat link (referensi), bukan copy.

Tanda pelanggaran: dua file berisi kalimat yang hampir identik.

---

## R4 — Capability, Not Model

CONTEXT.md dan SKILL.md tidak pernah menyebut nama model spesifik.
Gunakan capability type dari `_shared\providers.md`.
OmniRoute yang memutuskan model konkret.

Valid: `capability: reasoning-high`
Invalid: `model: claude-sonnet-4-6`

---

## R5 — Atomic Stage Output

Setiap stage menulis ke `output\`-nya sendiri.
Stage N tidak pernah menulis ke `output\` stage N+1 atau N-1.

---

## R6 — Walk Test

Setiap agent yang masuk ke Omega harus bisa menjawab
"di mana saya dan apa yang harus dilakukan selanjutnya"
hanya dari membaca `CLAUDE.md` root + maksimal 2 file lagi.

Jika tidak bisa → struktur folder yang perlu diperbaiki, bukan penjelasan yang lebih panjang.

---

## R7 — Human Gate Tidak Bisa Di-skip

Stage yang memiliki bagian `## Human check` di `CONTEXT.md` tidak bisa
dilanjutkan ke stage berikutnya tanpa file approval di `output\`.

Format file approval: `output\approved-[task]-YYYY-MM-DD.md`
Isinya: pernyataan manusia + tanggal + apa yang disetujui.

---

## R8 — Never Delete Without Log

Tidak ada file yang dihapus tanpa mencatat alasannya di `_shared\errors.md`.
Jika file perlu dihapus → log dulu → minta approval human → baru hapus.

---

## R9 — Fail Behavior Wajib

Setiap stage CONTEXT.md wajib punya bagian `## Fail behavior`.
Tanpanya, AI tidak boleh mengeksekusi stage tersebut.

---

## R10 — Fail Behavior: Never Delete

Dalam kondisi apapun, Fail behavior tidak boleh menghapus file.
Gagal → simpan output parsial → log → stop → minta human putuskan.

---

## R11 — CONTEXT.md Self-Identification

Setiap CONTEXT.md wajib menyatakan levelnya di baris pertama.
Format: `# CONTEXT.md — L{n} {Level Name} ({lokasi})`

Contoh:
```
# CONTEXT.md — L1 Pipeline Map (Projects/Quant-Lab/)
# CONTEXT.md — L2 Stage Contract (01_research/)
```

---

## R12 — Inheritance Hierarchy

Dua lapisan _shared/ ada di Omega:
1. `C:\Omega\_shared\` — global, berlaku untuk SEMUA proyek
2. `C:\Omega\Projects\[nama]\_shared\` — project-specific

Resolution order: project-level mengkhususkan global untuk proyek itu saja.
Aturan global tidak pernah ditimpa sepenuhnya — proyek bisa spesialisasi, tidak bisa negasi.

Contoh valid: global R1 = "log semua error". Project rule = "log error dengan field tambahan X".
Contoh invalid: project rule = "skip error logging untuk proyek ini".

---

*Aturan baru: tambahkan di sini, beri nomor berikutnya. Jangan duplikat di tempat lain.*
