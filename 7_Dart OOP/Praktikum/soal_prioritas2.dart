// NO1
class Calculator {
  int _angka1 = 0;
  int _angka2 = 0;

  Calculator(this._angka1, this._angka2);

  void penjumlahan() {
    //method penjumlahan
    var hasil = print('$_angka1 + $_angka2 = ${_angka1 + _angka2}');
    return hasil;
  }

  void pengurangan() {
    //method pengurangan
    var hasil = print('$_angka1 - $_angka2 = ${_angka1 - _angka2}');
    return hasil;
  }

  void perkalian() {
    //method perkalian]
    var hasil = print('$_angka1 * $_angka2 = ${_angka1 * _angka2}');
    return hasil;
  }

  void pembagian() {
    //method pembagian
    var hasil = print('$_angka1 / $_angka2 = ${_angka1 / _angka2}');
    return hasil;
  }
}

class Student {
  String name;
  String kelas;
  List<Course> courses = []; //buat nyimpen daftar course

  Student({required this.name, required this.kelas});

  void tampilkanCourse() {
    if (courses.length == 0) {
      print("Courses $name kelas $kelas masih kosong");
    } else {
      print("Courses milik $name kelas $kelas:");
      print("-" * 35);
      print("| No |\tCourse | Deskripsi"); //biar keliatan kyak tabel
      print("-" * 35);
    }
    for (var i = 0; i < courses.length; i++) {
      var course = courses[i]; //indexing
      print("| ${i + 1}  | ${course.judul} \t ${course.deskripsi}");
    } //nampilin yang ada dalam list
    print("-" * 35);
  }

  void tambahCourse(Course newCourse) {
    courses.add(newCourse); //menambahkan course ke list
    print("(+) Course ${newCourse.judul} berhasil ditambahkan");
  }

  void hapusCourse(Course delCourse) {
    courses.remove(delCourse); // hapus course dari list
    print("(-) Course ${delCourse.judul} berhasil dihapus");
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

  print("=" * 25);
  Student student1 = new Student(name: "amanda", kelas: "C");
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
