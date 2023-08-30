class TokoBuku {
  List<Buku> daftarBuku = [];

  void lihatBuku() {
    if (daftarBuku.length == 0) {
      print("Tidak ada buku");
    } else {
      print("-" * 75);
      print("| Id |\t Judul\t\t|\t penerbit\t| kategori \t| harga");
      print("-" * 75);
    }
    for (var i = 0; i < daftarBuku.length; i++) {
      var buku = daftarBuku[i];
      print(
          "| ${i + 1}  | ${buku.judul} \t ${buku.penerbit} \t ${buku.kategori} \t ${buku.harga}");
    }
  }

  void tambahBuku(Buku newBuku) {
    daftarBuku.add(newBuku);
    print(
        "(+) Buku dengan id ${newBuku.id} berjudul ${newBuku.judul} berhasil ditambahkan");
  }

  void hapusBuku(Buku delBuku) {
    daftarBuku.remove(delBuku);
    print(
        "(+) Buku dengan id ${delBuku.id} berjudul ${delBuku.judul} berhasil dihapus");
  }
}

class Buku {
  int id;
  int harga;
  String judul;
  String penerbit;
  String kategori;
  // List<String> kategoriBuku = ["self improvement", "ilmiah", "novel"];

  Buku(
      {required this.id,
      required this.harga,
      required this.judul,
      required this.penerbit,
      required this.kategori});
}

void main() {
  Buku buku1 = new Buku(
      id: 01,
      harga: 80000,
      judul: "Filosofi Teras",
      penerbit: "Penerbit Gramedia",
      kategori: "motivasi");

  Buku buku2 = new Buku(
      id: 02,
      harga: 93000,
      judul: "Sang Pemimpi",
      penerbit: "Penerbit Bentang",
      kategori: "novel fiksi");

  Buku buku3 = new Buku(
      id: 03,
      harga: 69000,
      judul: "3d Blender",
      penerbit: "Penerbit Gramedia",
      kategori: "ilimah");

  TokoBuku tokoBuku1 = new TokoBuku();
  tokoBuku1.lihatBuku();

  tokoBuku1.tambahBuku(buku1);
  tokoBuku1.tambahBuku(buku2);
  tokoBuku1.tambahBuku(buku3);

  tokoBuku1.lihatBuku();
  tokoBuku1.hapusBuku(buku2);
  tokoBuku1.lihatBuku();
  tokoBuku1.hapusBuku(buku3);
  tokoBuku1.lihatBuku();
}
