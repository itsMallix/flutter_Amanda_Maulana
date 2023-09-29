# Deep Dive Into Dart OOP
- constructor
- inheritance
- method overriding
- interface
- abstrac class
- polymorphism
- generic
- enscapsulation

# Constructor
- method yang dijalankan saat pembuatan object
- dapat menerima parameter
- tidak memiliki return
- nama sama dengan nama class

# Inheritance
- membuat class baru dengan memanfaatkan class yang sudah ada
- bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru

# Method Overriding
- Menulis ulang method yang ada pada super class
- bertujuan agar class memiliki method yang sama, dengan proses yang berbeda
- dilakukan pada class turunan
- method sudah ada pada super class
- method ditulis ulang seperti membuat method baru pada class turunan
- ditambahkan override pada baris sebelum method

# Interface
- berupa class
- menunjukkan method apa saja yang ada pada suatu class
- seluruh method wajib di override
- digunakan dengan menggunakan implements
- sekilas mirip inheritance
- pada class yang melakukan implements wajib override semua method

# Abstract class
- berupa class abstrak
- menunjukkan method apa saja yang ada pada suatu class
- digunakan dengan menggunakan extends
- tidak dapat dibuat object
- tidak semua method harus di override

# Polymorphism
- kemampuan data berubah menjadi bentuk lain
- tipe data yang dapat digunakan adalah super class
- dapat dilakukan pada class dengan extends atau implements

# Generics
- dapat digunakan pada class atau fungsi
- memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
- tipe data yang diinginkan, ditenukan saat membuat lass atau menjalankan fungsi

# Encapsulation
- mempromosikan penyembunyian data
- peningkatan integritas data
- memungkinkan perubahan pada satu bagian kode tanpa mempengaruhi bagian lain
- mengurangi kompleksitas dan potensi bug dalam kode

# Access Modifier
- public = kata public memingkinkan akses dari mana saja
- private = awalan _private membatasi akses hhanya dalam perpustakaan 1 class
- protected = dart tidak memiliki kata kunci proteted secara alami, tetapi secara konvensional, awalan _protected menunjukan akses terbatas

# Getter & Setter
- getter dan setter adalah metode untuk akses kontrol ke variable private
- memungkinkan enkapsulasi dengan menyediakan cara untuk membaca dan memodifikasi data privat, memastikan validasi / perhitungan 