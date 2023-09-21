# Dialog Bottom Sheet
## Alert Dialog
- untuk tampilan android dan material design
- menginformasikan pengguna tentang situasi tertentu
- bisa digunakan untuk mendapatkan input dari user
- membutuhkan helper method showdialog
- alert dialog menyediakan properti seperti content dan actions
- content bisa dimasukkan widget teks untuk menerima respon dari user

## Bottom Sheet
- seperti dialog namun muncul dari bawah layar
- menggunakan fungsi bawaan flutter showModalBottomSheet
- membutuhkan dua properti, yaitu context dan builder

## Task Management
- model digunakan sebagai informasi yang ingin disimpan 
- flutter memiliki konsep widget tree (bercabang)
- package provider bisa membantu kita untuk mengakses data ke halaman lain
- flutter menyediakan juga yaitu setState namun hanya bersifat lokal
- menampilkan data dengan navigation bisa namun kurang efektif
- ketika membuat class bru kita bisa memuat datanya dari provider
- provider akan berisi tumpukan properti
- comsumer adalah cara untuk mengakses global provider