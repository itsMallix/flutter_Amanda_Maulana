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
## Summary Kelas
- setstate digunakan pada perubahan yang tidak terlalu kompleks
- appstate seperti halnya sistem checkout pada ecommerce (brbagai data pada page belanja, keranjang, dan wishlist)
- bussiness login berkaitan dengan proses dari sistem atau aplikasi
- sebuah kesalahan jika menaruh logic pada bagian ui, lebih baik dipisahkan pada tempat tersendiri
- ui akan membuat sebuah event kemudian bloc akan memproses data ke db dan akan dikembalikan ke bloc
- bloc tidak sesimpel itu, kompleksitas tinggi
- bloc menerima event sebuah input dan dikelola pada bloc 
- terdapat constructor default atau constructor yang mengekstend bloc pada class yang mengekstend bloc
- pada material app harus dibungkus dengan bloc provider