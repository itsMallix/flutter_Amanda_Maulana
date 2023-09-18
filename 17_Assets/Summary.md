# Flutter Assets
- File yang di bundled dan di deploy bersamaan dalam aplikasi
- tipe assets seperti static data (json file), icon, image dan font file (ttf)
- pada pubspec.yaml pada bagian assets gunakan assets/
- pastikan akhiran mengugnakna /, kalau tidak maka seluruh asset dalam subdirectory tidak bisa di load
- 

## Image
- image atau gambar akan membeat tampilan aplikasi menjadi lebih menarik
- flutter mendukung format gambar seperti jpeg, webp, gif, animated web/gif, bmp dan wbmp
- flutter bisa mengakses gambar dari lokal storage dan dari internet
- akses dari internet menggunakan image link

## Font
- penggunaan font style tentu akan menjadi keunikan pada aplikasi
- penentuan font yang mau dipakau biasanya oleh ui designer
- penerapan font menggunakan custom font atau dari package
- assets font bisa di dapat di website google font
- deklarasi asset di lakukan pada materialapp > theme > themeData

## Custom font
- cari dan download font di google font
- import file .tff
- daftarkan font pada pubspec.yaml
- mengatur font sebagai default
- font daripackage bisa di add lewat pub add

## Font dari packages
- pakai packages google font
- packages google font inject packages lainn, lumayan banyak packages tambahan jika menggunakan google font packages

