# FLutter Bloc
## Declarative UI
- flutter memiliki sifat deklaratif ui yang artinya flutter membangun UI pada screen untuk mencerminkan keadaan state saat ini
## State
- state adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori
- flutter akan membangun ulang UI ketika da state atay data yang berubah
- ada 2 jenis state dalam flutter, ephermal state dan app state
## Ephemeral state 
- digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk megnakses data widget nya, seperti page view, bottom navigation bar, switch button
- tidak perlu state managemen yang kompleks
- hanya membutuhkan stetful widget dengan menggunakan setState
## App state
- digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, seperti login info, pengaturan preferensi pengguna, keranjang belanja dimana suatu screen menampilkan data yang berbeda
## Pendekatan State Management
- SetState (lebih cocok penggunaan pada ephemeral state)
- Provider (penggunaan state management yang komples seperti app state)
- Bloc (menggunakan pola stream/observable untuk memisahkan UI dengan bisnis logic)
## Bloc
- Bloc adalah singkatan dari business logic component
- memisahkan antara bisness logic dengan UI
- simple, powerfull, testable
## Cara Kerja Bloc
- menerima event sebagai input
- dianalisa dan dikelola di dalam bloc
- menghasilkan state sebagai output
## Stream 
- rangkaian proses secara async
- actor utama didalam Bloc
- equatable adalah sebuah package yang akan mengecek perubahan pada getter