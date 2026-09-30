# Composition Rationale - Fandom Vault (Video Game Backlog Manager)
**Case study:** AFL 1 - Track A, The Fandom Vault (Video Game Backlog Manager).
**Primary screen:** `BacklogScreen` — search, status/tag filtering, list/grid layout, and per-game status changes.

**State hoisting rule:** semua state disimpa di `BacklogScreen`. setiap extracted
widget adalah `StatelessWidget` yang tidak menyimpan apa pun
Alurnya ; Data turun ke bawah lewat konstruktor (induk memberi data ke anak). dan
 naik ke atas lewat callback (anak memberi tahu induk bahwa ada yang berubah).widget classes: **11**
(minimum required: 4).
# Arti istilah "trigger":
- Reuse = widget dipakai berulang kali atau di beberapa tempat.
- Readability = widget dipisah supaya kode layar utama lebih pendek dan mudah dibaca.

## SearchField
- **Trigger:** Readability. kotak pencaharian `TextField` dan tampilannya dipisah supaya `build` layar utamanya tidak terlalu panjang.
- **Owns:** Tidak ada (no controller; Teks pencarian disimpan di induk,).
- **Reports upward:** `onChanged(String)`, yaitu teks pencarian terbaru.

## StatusFilterBar
- **Trigger:** Readability. Baris chip status dan perulangan `GameStatus.values`dipisah dari layar utama.
- **Owns:** Tidak ada. Status yang dipilih diterima lewat `selected`.
- **Reports upward:** `onSelected(GameStatus?)`yaitu status yang dipilih, atau `null` kalau memilih "All".

## StatusBadge
- **Trigger:** Reuse.Dipakai oleh `StatusPicker` (yang selanjutnya dipakai sama `GameCard` dan `GameGridTile`); Widget ini juga menyimpan pemetaan warna status `statusColor` yang dipakai bersama.
- **Owns:** tidak ada.
- **Reports upward:** tidak ada (cuma menampilkan).

## StatusPicker
- **Trigger:** Reuse. Perilaku "ketuk badge lalu pilih status baru" dibutuhkan di tampilan list maupun grid, jadi ditulis sekali saja.
- **Owns:** Tidak ada state aplikasi. Buka-tutup menu popup diurus sendiri oleh `PopupMenuButton`milik Flutter.
- **Reports upward:** `onSelected(GameStatus)`, yaitu status baru yang dipilih.

## GameCard
- **Trigger:** Reuse. Satu kartu dibuat untuk setiap game pada tampilan list.
- **Owns:** Tidak ada. Hanya mengatur tampilan (avatar, teks keterangan, bintang).
- **Reports upward:** `onStatusChange(GameStatus)` diteruskan dari `StatusPicker`.

## GameGridTile
- **Trigger:** Reuse. Satu kotak dibuat untuk setiap game pada tampilan grid. Dipisah dari `GameCard` karena bentuk tampilannya berbeda.
- **Owns:** Tidak ada.
- **Reports upward:** `onStatusChange(GameStatus)` diteruskan dari `StatusPicker`.

## GameCollection
- **Trigger:** Readability. Widget ini memutuskan apakah yang ditampilkan adalah pesan kosong, list, atau grid, sehingga `build` layar utama tetap sederhana.
- **Owns:** Tidak ada. Hanya menampilkan `games` yang sudah difilter oleh induk.
- **Reports upward:** `onStatusChange(Game, GameStatus)` Ia menambahkan informasi game mana yang berubah ke kejadian yang datang dari kartu atau kotak.

## EmptyState
- **Trigger:** Reuse / readability. Tampilan "tidak ada hasil" yang berdiri sendiri dan bisa dipakai di daftar mana pun.
- **Owns:** Tidak ada (seluruhnya constant).
- **Reports upward:** tidak ada.


