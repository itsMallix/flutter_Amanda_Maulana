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