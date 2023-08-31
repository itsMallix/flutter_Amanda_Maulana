// class Hewan {
//   //polymorphism
//   reproduksi() {
//     print("tidak diketahui");
//   }

//   bernafas() {
//     print("tidak diketahui");
//   }
// }

// class Paus extends Hewan {
//   @override
//   reproduksi() {
//     print("melahirkan");
//   }

//   @override
//   bernafas() {
//     print("paru-paru");
//   }
// }

// class Ular extends Hewan {
//   @override
//   reproduksi() {
//     print("bertelur");
//   }

//   @override
//   bernafas() {
//     print("paru-paru ular");
//   }
// }

// class Hadiah<T> {
//   var isi;
//   //generics
//   Hadiah(T i) {
//     isi = i;
//   }
// }

// void main() {
//   Hewan hewan1 = Hewan();
//   print(hewan1);

//   hewan1 = Paus();
//   print(hewan1);
//   hewan1.bernafas();

//   hewan1 = Ular();
//   print(hewan1);
//   hewan1.bernafas();

//   var h1 = Hadiah<String>("mobil");
//   print(h1.isi);

//   var h2 = Hadiah<int>(100);
//   print(h2.isi);
// }

void cekTipe<T>(T data) {
  print(data.runtimeType);
}

void main() {
  cekTipe<String>('data');
  cekTipe<int>(3);
  cekTipe<bool>(true);
}
