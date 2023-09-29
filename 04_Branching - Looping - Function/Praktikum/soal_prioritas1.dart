import 'dart:io';

/* 
1. Terdapat nilai jika nilai lebih dari 70 return A
jika nilai lebih dari 40 return B dan jika nilai lebih dari 0 return C 
2. Tampilkan nilai 1 sd 10 pada layar menggunakan looping
*/
void main() {
  // No 1
  stdout.write("Masukkan nilai : ");
  var input = stdin.readLineSync();
  int nilai = int.parse(input!);
  if (nilai > 70) {
    print("Nilai A");
  } else if (nilai > 40) {
    print("Nilai B");
  } else if (nilai > 0) {
    print("Nilai C");
  } else {
    print(" ");
  }

  print("=" * 25);

  // No 2
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}
