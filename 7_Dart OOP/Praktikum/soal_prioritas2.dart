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
  String name;
  String kelas;
  List<Course> courses = [];

  Student({required this.name, required this.kelas});

  void tampilkanCourse() {
    print("Courses milik $name kelas $kelas:");
    for (var i = 0; i < courses.length; i++) {
      var course = courses[i];
      print("${i + 1}. ${course.judul} - ${course.deskripsi}");
    }
  }

  void tambahCourse(Course newCourse) {
    courses.add(newCourse);
    // print("Course ${newCourse.judul} berhasil ditambahkan");
  }

  void hapusCourse(Course delCourse) {
    courses.remove(delCourse);
    print("Course ${delCourse.judul} berhasil dihapus");
  }
}

class Course {
  String judul;
  String deskripsi;

  Course({required this.judul, required this.deskripsi});
}

void main() {
  int angka1 = 4;
  int angka2 = 10;
  Calculator calculator = Calculator(angka1, angka2);
  calculator.penjumlahan();
  calculator.pengurangan();
  calculator.perkalian();
  calculator.pembagian();

  Student student1 = new Student(name: "amanda", kelas: "Flutter-C");
  student1.tampilkanCourse();

  Course course1 = new Course(judul: "Flutter", deskripsi: "Belajar Flutter");
  Course course2 = new Course(judul: "UI/UX", deskripsi: "Belajar Ui/Ux");
  Course course3 = new Course(judul: "Golang", deskripsi: "Belajar golang");

  student1.tambahCourse(course1);
  student1.tambahCourse(course2);
  student1.tambahCourse(course3);

  student1.tampilkanCourse();
  student1.hapusCourse(course2);
  student1.tampilkanCourse();
}
