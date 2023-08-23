import 'dart:io';

// NO 1
cekBilanganPrima() {
  stdout.write("Masukkan Bilangan Yang Ingin Di Cek : ");
  var input = stdin.readLineSync();
  int bilangan = int.parse(input!);

  if (bilangan <= 1) {
    stdout.write("$bilangan bukan bilangan prima");
  }
  if (bilangan == 2) {
    stdout.write("$bilangan adalah bilangan prima");
  }
  if (bilangan > 1) {
    for (int i = 2; i < bilangan;) {
      if (bilangan % i == 0) {
        stdout.write("$bilangan bukan bilangan prima");
        break;
      } else {
        stdout.write("$bilangan adalah bilangan prima");
        break;
      }
    }
  }
  stdout.write("\n");
}

// NO 2
tampilkanTabel() {
  stdout.write("Masukkan Angka : ");
  var hasil = stdin.readLineSync();
  int angka = int.parse(hasil!);

  for (int i = 1; i <= angka; i++) {
    for (int j = 1; j <= angka; j++) {
      stdout.write("${i * j}\t");
    }
    print(' ');
  }
}

void main() {
  cekBilanganPrima();
  tampilkanTabel();
}
