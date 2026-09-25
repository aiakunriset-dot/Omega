# Error Journal — Global

Log error lintas proyek. AI berikutnya wajib membaca ini sebelum mulai.

## Format wajib (lihat rules.md R1)

```markdown
### Error: [deskripsi singkat]
- **Context:** sedang mengerjakan apa
- **Symptom:** apa yang terlihat
- **Root cause:** mengapa (atau "unknown — perlu investigasi")
- **Fix:** apa yang menyelesaikannya (atau "pending")
- **Date:** YYYY-MM-DD
```

## Aturan

- AI drafts → human approves → baru di-append
- Tidak ada penghapusan entry (append-only)
- Error yang spesifik satu proyek → catat di `Projects\[nama]\_shared\errors.md`
- Error yang mungkin berulang di banyak proyek → catat di sini

---

<!-- Error akan ditambahkan dari penggunaan nyata. Kosong di V1.0. -->
