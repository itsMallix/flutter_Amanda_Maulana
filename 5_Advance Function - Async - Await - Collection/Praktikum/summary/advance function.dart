// Anonymous Function
var hello = () {
  print("Hello World");
};

var jumlah = (int a, int b) {
  int hasil = a * b;
  print(hasil);
};

void main() {
  hello();
  jumlah(2, 5);
  arrowFunction();
  arrowFunction2(3, 2);
}

// Arrow Function
var arrowFunction = () => print("contoh arrow function");
var arrowFunction2 = (param1, param2) => print(param1 / param2);
