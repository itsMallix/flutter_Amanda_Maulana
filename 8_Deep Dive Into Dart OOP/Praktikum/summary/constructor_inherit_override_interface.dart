abstract class Hewan {
  int? mata;
  int? kaki;

  Hewan() {
    // ini adalah constructor
    mata = 0;
    kaki = 0;
  }

  void makan() {
    print("makan rumput");
  }

  void gelud() {
    print("nyeruduk");
  }
}

class Kucing extends Hewan {
  // inheritance ditandai dengan extend
  Kucing() {
    mata = 2;
    kaki = 4;
  }

  @override //contoh override
  void makan() {
    print("makan whiskas");
  }

  @override
  void gelud() {
    print("nyakar");
  }
}

class Buaya implements Hewan {
  // interface
  @override
  void makan() {
    print("makan daging");
  }

  @override
  void gelud() {
    print("sambil ngeprone");
  }

  @override
  int? kaki;

  @override
  int? mata;
  Buaya({required this.mata, required this.kaki});
}

void main() {
  // var banteng = Hewan(); //abstract class tidak bisa langsung di isntance
  // print(banteng.mata);
  // print(banteng.kaki);
  // banteng.makan();
  // banteng.gelud();

  var kucing = Kucing();
  print(kucing.mata);
  print(kucing.kaki);
  kucing.makan();
  kucing.gelud();

  var buaya = Buaya(mata: 2, kaki: 4);
  print(buaya.mata);
  print(buaya.kaki);
  buaya.makan();
  buaya.gelud();
}
