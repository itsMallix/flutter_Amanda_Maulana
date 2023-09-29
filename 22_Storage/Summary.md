# Flutter Storage
## Local Storage
- dieprlukan untuk efisiensi penggunaan data internet
- local storage seperti shared preferences dan local db
## Shared Preferences
- menyimpan data yang sederhana
- penyimpanan dengan format key-value
- menyimpan tipe data dasar seperti teks, angka dan boolean
- conton shared prefenreces adalah seperti menyimpan data login dan riwayat pencarian
## Local Database (SQLite)
- meyimpan dan meminta data dalam jumlah besar pada local device
- bersifat private
- menggunakan sqlite db melalui package
- sqlite adalah db open source yang mendukun crud
# Summary Kelas
- ketika user login data" akan disimpan pada local storage
- shared preference digunakan untuk simple data
- akan bertahan pada disk async dan tidak ada jaminan akan bertahan setelah kembali
- formkey lebih efisien, namun secara analisis lebih safe menggunakan controller masing" text form field
