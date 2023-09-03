abstract class Matematika {
  int hasil(int x, int y);
}

class KPK implements Matematika {
  int x;
  int y;

  KPK(this.x, this.y);

  @override
  int hasil(int x, int y) {
    return (x * y) ~/ FPB().hasil(x, y);
  }
}

class FPB implements Matematika {
  @override
  int hasil(int x, int y) {
    while (y != 0) {
      int temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }
}

void main() {
  KPK operation = KPK(2, 6);
  int hasilKPK = operation.hasil(operation.x, operation.y);
  print("Hasil KPK: $hasilKPK");

  FPB operations = FPB();
  int hasilFPB = operations.hasil(32, 18);
  print("Hasil FPB: $hasilFPB");
}
