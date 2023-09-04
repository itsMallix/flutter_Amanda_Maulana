# Flutter CLI & FLutter Package Management
- alat yang digunakan untuk berinteraksi flutter SDK
- perintah dijalankan dalam terminal

# Importan CLI Commands
- flutter create <APP_NAME> (perintah untuk membuat project flutter )
- flutter doctor (perintah manampilkan info software yang dibutuhkan)
- flutter run <DART_FILE> (perintah untuk run project aplikasi)
- flutter emulator (perintah untuk menampilkan daftar emulator terinstal)
- flutter channel (perintah manmpilkan daftar flutter channel yang tersedia)
- flutter pub <get/add> (untuk menampahkan pkg ke pubspec.yaml dan mendownload depedencies yang ada di pubspec yaml)
- flutter build (perintah untuk build file aplikasi untuk deploy)
- flutter clean (untuk menghapus folder build serta file lain yang dihasilkan saat kita menjalankan aplikasi emulator)

# Packages Management
- flutter mendukung sharing packages
- packages dibuat oleh developer lain
- mempercepat pengembangan aplikasi karena tidak perlu membuat semua dari awal
- mendapat packages di web pub.dev

# Cara Menambah Packages
- cari package di pub.dev
- copy baris dependencies yang ada di bagian installing
- buka pubspec.yaml
- paste barisan dibawah dependencies pubspec.yaml
- run fluter pub get di terminal
- import packaged di file dart agar bisa digunakan
- stop atau restart app jika dibutuhkan

#