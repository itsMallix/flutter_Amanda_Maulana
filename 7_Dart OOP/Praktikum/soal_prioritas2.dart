// NO1
class Calculator {
  int _angka1 = 0;
  int _angka2 = 0;

  Calculator(this._angka1, this._angka2);

  void penjumlahan() {
    var hasil = print('$_angka1 + $_angka2 = ${_angka1 + _angka2}');
    return hasil;
  }

  void pengurangan() {
    var hasil = print('$_angka1 - $_angka2 = ${_angka1 - _angka2}');
    return hasil;
  }

  void perkalian() {
    var hasil = print('$_angka1 * $_angka2 = ${_angka1 * _angka2}');
    return hasil;
  }

  void pembagian() {
    var hasil = print('$_angka1 / $_angka2 = ${_angka1 / _angka2}');
    return hasil;
  }
}

class Student {
  String name = "";
  String kelas = "";
  List<Course> course = [];
  void tampilkanCourse() {
    print(course);
  }
}

class Course {}

void main() {
  int angka1 = 4;
  int angka2 = 10;
  Calculator calculator = Calculator(angka1, angka2);
  calculator.penjumlahan();
  calculator.pengurangan();
  calculator.perkalian();
  calculator.pembagian();

  var student1 = Student();
  student1.name = "amanda";
  student1.kelas = "Kelas C";
}
