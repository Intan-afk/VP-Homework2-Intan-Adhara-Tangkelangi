# Audit Komponen

Tujuan: mencari bagian yang saya buat sendiri padahal sudah menyediakan komponen, kemudian saya menggantinya dengan komponen yang saya butuhkan.

## Yang Diganti

### SearchField
- **Versi buatan sendiri (week 02):** `TextField` dengan `InputDecoration` dan `OutlineInputBorder` yang dibuat manual, termasuk radius sudut.
- **Pengganti dari Material (week 03):** `SearchBar` dari Material 3, gayanya diatur lewat `SearchBarThemeData`.

### StatusBadge
- **Versi buatan sendiri (week 02):** `Chip` yang diberi gaya manual di setiap pemakaian (`labelStyle`, `side`, dan warna dikirim satu per satu).
- **Pengganti dari Material (week 03):** `Chip` biasa yang mengikuti tema, dengan titik warna di bagian `avatar`. Warnanya diambil dari ThemeExtension `StatusColors`.

### Fungsi statusColor()
- **Versi buatan sendiri (week 02):** warna `Colors.green`, `Colors.blue`, `Colors.red`, dan `Colors.orange` ditulis langsung di dalam fungsi.
- **Pengganti dari Material (week 03):** ThemeExtension `StatusColors` dengan nilai warna terpisah untuk mode terang dan gelap.

### Avatar di GameCard dan GameGridTile
- **Versi buatan sendiri (week 02):** warna status ditulis langsung pada `CircleAvatar`.
- **Pengganti dari Material (week 03):** peran warna dari `ColorScheme`, yaitu `secondaryContainer` dan `onSecondaryContainer`.

### EmptyState
- **Versi buatan sendiri (week 02):** ikon memakai `Colors.grey` yang ditulis langsung.
- **Pengganti dari Material (week 03):** `colorScheme.outline`