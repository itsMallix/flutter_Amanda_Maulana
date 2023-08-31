class BangunRuang {
  double tinggi;
  double panjang;
  double lebar;

  BangunRuang(
      {required this.tinggi, required this.panjang, required this.lebar});

  void volume() {
    double hasil = panjang * lebar * tinggi;
    print("volume = $hasil");
  }
}

class Balok extends BangunRuang {
  double tinggi;
  double panjang;
  double lebar;

  Balok({required this.tinggi, required this.panjang, required this.lebar})
      : super(tinggi: tinggi, panjang: panjang, lebar: lebar);

  void volume() {
    double hasil = panjang * lebar * tinggi;
    print("volume balok adalah = $hasil");
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus({required this.sisi}) : super(tinggi: sisi, panjang: sisi, lebar: sisi);

  @override
  void volume() {
    double hasil = sisi * sisi * sisi;
    print("Volume kubus adalah = $hasil");
  }

  double volumes() {
    return sisi * sisi * sisi;
  }
}

void main() {
  Balok balok = Balok(tinggi: 7, panjang: 2, lebar: 13);
  balok.volume();

  Kubus kubus = Kubus(sisi: 8);
  kubus.volume();
  print(kubus.volumes());
}
