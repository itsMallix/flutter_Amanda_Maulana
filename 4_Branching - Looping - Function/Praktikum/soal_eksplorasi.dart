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
}

void main() {
  cekBilanganPrima();
}
