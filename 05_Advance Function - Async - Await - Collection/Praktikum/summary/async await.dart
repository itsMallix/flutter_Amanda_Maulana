// void P1() {
//   Future.delayed(Duration(seconds: 2), () {
//     print("halo adari P1");
//   });
// }

// void P2() {
//   print("halo dari P2");
// }

Future<void> PP1() async {
  await Future.delayed(Duration(seconds: 1), () {
    print("halo adari PP1");
  });
}

void PP2() {
  print("halo dari PP2");
}

void main() async {
  // P1();
  // P2();
  await PP1();
  PP2();
}
