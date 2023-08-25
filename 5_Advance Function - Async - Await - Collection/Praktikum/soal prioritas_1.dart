// NO 1
soalPrioritas1(List<int> angka, int pengali) {
  List<int> hasil = [];
  for (var i in angka) {
    hasil.add(i * pengali);
  }
  print(hasil);
}

void main() {
  List<int> angka = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  soalPrioritas1(angka, 2);
}
