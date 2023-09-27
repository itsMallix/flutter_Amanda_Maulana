# FLutter Global State Management
## State
- data yang dapat dibaca saat pembuatan widget
- dapat berubah saat widgett sedang aktif
- hanya dimiliki oleh stateful widget
- stateful memerlukan global state yang sama dengan mudah

## Global State
- state biasa yang dapat digunakan pada seluruh widget
- provider (package management & perlu diinstal terlebih dahulu)

## Summary Kelas
- pada saat inisialisasi secara default sudah ada example code dari flutter
- setState merupakan state management untuk mengecek state
- pada state menegement sebenarnya flutter membuild kembali dan menampilkan data yang di simpan data pada setState
- local state hanya bisa diakses pada file tertentu
- notify listener berfungsi agar function yang terhubing dengan add akan reload ketika dipanggil
- init state pada stateful widget digunakan untuk menginisialisasi keadaan (state) widget saat widget tersebut pertama kali dibuat 
