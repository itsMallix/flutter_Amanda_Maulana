# MVVM Architecture
## Model-View-View Model
- memisahkan logic dengan tampilan ke dalam viewmodel
## Keuntungan 
- jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan viewmodel yang sama
- mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
- pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat eningkatkan produktivitas pada pengujian
## Struktur Direktori MVVM
- model memiliki 2 bagian yaitu data yang akan digunakan dan sumber data tersebut
- tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat view dan viewmodel
## Model
- bentuk data yang akan digunakan, dibuat dalam bentuk class
- data yang dimuat diletakka pada property
## View Model
- menyimpan data dan logic yang diperlukan pada halaman tertenty
- jika widget lain memerlukan logic yang sama, dapat menggunakan view model ini juga
## Mendaftarkan viewmodel
- menggunakan multiprovider agar dapat menggunakan banyak viewmodel
- materialapp sebagai child utama
- pada view menggunakan stateful widget