# FLutter Form
## Form
- menerima isian data dari pengguna
- isian data dapat lebih dari 1
- menggunakan statefulwidget
- keadaan form disimpan menggunakan globalkey

## Textfield
- Menerima isisan data dari pengguna
- isian data dapat lebih dari 1
- data diambil menggunakan controller
- isian data berupa text

## Radiobtn
- memberi opsi pada pengguna
- hanya dapat memilih 1 opsi
- data diambil menggunakan property dengan tipe data sesuai value pada radio btn

## Checkbox
- memberi opsi pada pengguna
- dapat memilih beberapa opsi
- data diapbil menggunakan property bertipe bool

## Dropdown btn
- member opsi pada pengguna
- dapat memilih 1 opsi
- opsi tidak ditampilkan di awal hanya tampil jika ditekan
- data diambil menggunakan property ddengan tipe daata sesuai value pada dropdown menu item

## Button
- bersifat seperti tombol
- dapat melakukan sesuatu saat ditekan

### Elevated Button
- tombol yang timbul
- menjalankan function onPressed

### Icon button
- tombol yang hanya menampilkan icon
- menjalankan function onPressed

## Summary Kelas
- pada textfield tidak ada validaor bawaan, perlu di declare pada fungsi onpressed (buttonnya)
- perbedaan textfield dan textformfield terletak pada validatornya, textfield dibuat lebih simple dan sederhana
- penggunaan icon diluar package flutter bisa menggunakan, image link, png atau font awesome, bisa menggunakan svg agar resolusi gambar tidak pecah ketika diubah ukurannya
- untuk nampilkan data yang diinputkan perlu state, dan data disimpan pada variable atau list
- controller di dart flutter menyimpan dalam tipe data string, jika ingin menyimpan tipe data lain bisa melakukan pharse pada nilai yang disimpan

