import 'dart:io';

/*
1. Buatlah sebuah piramid bintang menggunakan looping 
2. Buatlah sebuah jam pasir menggunakan looping
3. Buatlah sebuah fungction dengan parameter untuk menghitung luas ligkaran
dan jalankan pada function main
4. Tampilkan faktorial dari 10, 40, 50.
*/
double phi = 3.14;

luasLingkaran(phi, int r) {
  double hasil = phi * r * r;
  print("Luas Lingkaran = $hasil");
}

int hitungFaktorial(int numb) {
  if (numb == 0 || numb == 1) {
    return 1;
  } else {
    return numb * hitungFaktorial(numb - 1);
  }
}

void main() {
  // No 1
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

  // No 2
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

  // No 3
  print("=" * 25);
  luasLingkaran(phi, 12);

  // No 4
  stdout.write('Masukkan bilangan: ');
  var hasil = stdin.readLineSync();
  int bilangan = int.parse(hasil!);

  int faktorial = hitungFaktorial(bilangan);
  print('$bilangan! = $faktorial');
}
