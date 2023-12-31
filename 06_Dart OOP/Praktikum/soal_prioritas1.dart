// NO1 & NO2
class Hewan {
  int _berat = 0;
  int get berat => _berat;
  Hewan(this._berat); //constructor
}

class Mobil {
  int kapasitas = 10;
  List<Hewan> muatan = []; //buat nyimpen daftar hewan muatan

  void tambahanMuatan(List<Hewan> hewan) {
    for (var hewan in hewan) {
      if (hewan.berat <= kapasitas) {
        //jika berat hewan kurang dari muatan maka masuk list
        muatan.add(hewan);
      }
    }
  }

  void totalMuatan() {
    int totalBerat = 0;
    for (var hewan in muatan) {
      totalBerat += hewan.berat; //hitung total keseluruhan berat hewan
    }
    print(
      "Kapasitas maximum: $kapasitas\nTerisi : ${muatan.length} hewan\nTotal berat muatan: $totalBerat",
    );
  }
}

void main() {
  var ayam = Hewan(1);
  var sapi = Hewan(3);
  var kambing = Hewan(2);
  var dino = Hewan(20);
  var megalodon = Hewan(100);

  var mobil = Mobil();
  mobil.tambahanMuatan([ayam, sapi, kambing, dino, megalodon]);
  mobil.totalMuatan(); //dino dan megalodon tidak masuk list karena overweight
}
