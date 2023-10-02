# API Serialization & Desserialization
- arsitektural yang memisahkan view degnan bussiness logic
- bagian tampilan dan logic melakukan transaksi melalui protokol http
- GET (meminta/ menampilkan informasi dari server)
- POST (mengirim/ menambah data ke server)
- PUT (mengubah data pada server)
- DELETE (menghapus data dari server)
- REST API adalah lapisan/ jembatan antara server degan client
- API mengirim response degnan format tertentu biasanya json
- Json adalah javascript object notation (sekumpulan data yang dikelompokkan berupa map atau array)
# HTTP
- protokul yang digunakan untuk berkirim data pada internet, biasanya data tersebut benbentuk media web
- pola komunikasi http mirip seperti API, mengirim request dan memberi response
- 
# Struktur Request
### URL / endpoint
- alamat halaman yang akan diakses
### Method (GET, POST, PUT, DELETE)
- menunjukkan aksi yang diinginkan
### Header
- informasi tambahan terkait request yang dikirimkan
### Body (hanya ada pada method post, put, delete)
- data yang disertakan bersama request

# Struktur Response
### Status Code
- kode yang mewakili keseluruhan response baik sukses / gagal
### Header
- informasi tambahan terkait responses yang diberikan
### Body
- data yang disertakan bersama response