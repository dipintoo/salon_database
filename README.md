![Cover]()

## Goals

Membuat aplikasi janji temu salon yang mampu mengenali customer lama dan customer baru berdasarkan nomor telepon. Customer bisa memilih layanan salon yang diinginkan lalu membuat janji temu pada jam tertentu. Setelah berhasil membuat janji, aplikasi akan memberikan konfirmasi pemesanan.

## Alur Kerja

### Database

Membuat database [salon](https://github.com/dipintoo/salon_database/blob/main/simple_salon.sql) yang terdiri dari tabel `customers`, `services`, dan `appointments`.

### Algoritma Bash Script

1. Menampilkan menu layanan salon yang tersedia dari dalam database
2. Meminta customer untuk menginput nomor urut dari layanan salon yang tersedia
3. Memeriksa apakah input berupa angka atau bukan. Jika bukan, cetak pesan kesalahan.
4. Jika input berupa angka,

   - Ambil nama layanan berdasarkan ID nya dari database
   - Jika nama layanan tidak ditemukan, cetak pesan kesalahan dan meminta customer menginput lagi nomor urut layanan yang valid
5. Selanjutnya, aplikasi meminta customer menginput nomor teleponnya,
   - Jika customer lama, maka aplikasi akan langsung mengarah ke membuat janji temu
   - Jika pelanggan baru, datanya akan disimpan dulu ke database, sebelum lanjut membuat janji temu
6. Customer membuat janji temu dengan menginput jam tertentu
7. Menampilkan pesan konfirmasi berisi nama customer, layanan salon yang dipilih, dan jam temu.


