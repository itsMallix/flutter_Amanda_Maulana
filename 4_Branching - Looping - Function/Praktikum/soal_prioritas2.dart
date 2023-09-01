import 'dart:io';

double phi = 3.14;

/*
1. Buatlah sebuah piramid bintang menggunakan looping 
2. Buatlah sebuah jam pasir menggunakan looping
3. Buatlah sebuah fungction dengan parameter untuk menghitung luas ligkaran
dan jalankan pada function main
4. Tampilkan faktorial dari 10, 40, 50.
*/

// No 1
buatPiramid() {
  stdout.write("Masukkan juumlah baris : ");
  var input = stdin.readLineSync();
  int tinggi = int.parse(input!);

  for (int i = 1; i <= tinggi; i++) {
    for (int j = tinggi - i; j > 0; j--) {
      stdout.write(' ');
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write('*');
    }

    stdout.write('\n');
  }
  print("=" * 25);
}

// No 2
buatJampasir() {
  stdout.write("Masukkan jumlah baris : ");
  var input = stdin.readLineSync();
  int tinggi = int.parse(input!);

  for (int i = 0; i < tinggi; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }
    for (int k = 1; k <= 2 * (tinggi - i) - 1; k++) {
      stdout.write('0');
    }
    print(' ');
  }

  for (int i = tinggi - 2; i >= 0; i--) {
    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }
    for (int k = 1; k <= 2 * (tinggi - i) - 1; k++) {
      stdout.write('0');
    }
    print(' ');
  }
  print("=" * 25);
}

// No 3
luasLingkaran(phi) {
  stdout.write("Masukkan jari-jari : ");
  var jariJari = stdin.readLineSync();
  int r = int.parse(jariJari!);

  double hasil = phi * r * r;
  stdout.write("Jari-jari = $r\nLuas Lingkaran = $hasil\n");
  print("=" * 25);
}

// No 4
double hitungFaktorial(double numb) {
  if (numb == 0 || numb == 1) {
    return 1;
  } else {
    return numb * hitungFaktorial(numb - 1);
  }
}

void main() {
  buatPiramid();
  buatJampasir();
  luasLingkaran(phi);

  stdout.write('Masukkan bilangan: ');
  var hasil = stdin.readLineSync();
  double bilangan = double.parse(hasil!);

  double faktorial = hitungFaktorial(bilangan);
  print('$bilangan! = $faktorial');
}
