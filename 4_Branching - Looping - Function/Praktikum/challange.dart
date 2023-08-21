//  membuat fungtion untuk menghitung jumlah barang yang sudah kita beli dari sebuah toko
var buku = 10000;
var pensil = 5000;
var tas = 100000;

int totalBarang(buku, pensil, tas) {
  return buku + pensil + tas;
}

double diskon(buku, pensil, tas) {
  return totalBarang(buku, pensil, tas) * 10 / 100;
}

double tagihan(buku, pensil, tas) {
  return totalBarang(buku, pensil, tas) - diskon(buku, pensil, tas);
}

void main(List<String> args) {
  print(totalBarang(buku, pensil, tas));
  print(diskon(buku, pensil, tas));
  print(tagihan(buku, pensil, tas));
}
