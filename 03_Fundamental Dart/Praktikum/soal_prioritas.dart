void main() {
/*SOAL PRIORITAS 1 
  1. Buatlah rumus keliling dan luas persegi dan persegi panjang
  dengan menggunakan bahasa pemrograman dart
  2. Implementasikan rumus keliling dan luas dari lingkaran
  menggunakan bahasa pemrograman dart
*/
// Rumus keliling dan luas persegi
  int sisi = 4;
  int keliling_persegi = 4 * sisi;
  int luas_persegi = sisi * sisi;

  print("Keliling persegi adalah $keliling_persegi");
  print("Luas persegi adalah $luas_persegi");
  print("=" * 25);
// Rumus kliling dan luas persegi panjang
  int panjang = 20;
  int lebar = 7;
  int keliling_persegi_panjang = 2 * (panjang + lebar);
  int luas_persegi_panjang = panjang * lebar;

  print("keliling persegi panjang adalah $keliling_persegi_panjang");
  print("Luas persegi panjang adalah $luas_persegi_panjang");
  print("=" * 25);

/*SOAL PRIORITAS 2
  1. Buatlah 3 buah variabel yang menampung string , lalu sambungkan 3 variabel tersebut
  dan tampilkan pada layar
  2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan
  bahasa pemrograman dart
*/
// 1 Variabel sambung
  String kata1 = "Mohon ajarin";
  String kata2 = "Dong puh";
  String kata3 = "Sepuhh";

  String kata_gabungan = "$kata1 $kata2 $kata3";
  print(kata_gabungan);
  print("=" * 25);
// 2 Rumus volume tabung luas alas lingkaran x tinggi
// rumus Luas alas lingkaran
  double phi = 3.14;
  double jari = 12;
  double luas_lingkaran = phi * jari * jari;
  double tinggi = 15;
  double volume_tabung = luas_lingkaran * tinggi;

  print(
      "Luas alas lingkaran adalah $luas_lingkaran \ntinggi tabung adalah $tinggi \njadi volume tabung adalah $volume_tabung");
  print("=" * 25);
}
