// NO 1
soalEksplorasi_no1() {
  List<String> sampleInput = [
    "amuse",
    "tommy kaira",
    "spoon",
    "HKS",
    "litchfield",
    "amuse",
    "HKS"
  ];
  List<String> result =
      Set.of(sampleInput).toList(); //convert ke set kemudian jadikan list lagi
  print(result); //collection set otomatis filtering data redundan
}

// NO 2
soalEksplorasi_no2() {
  List<String> sampleInput = [
    "js",
    "js",
    "js",
    "golang",
    "python",
    "golang",
    "js",
    "js",
    "rust"
  ];

  var result = Map();
  sampleInput.forEach((element) {
    if (!result.containsKey(element)) {
      result[element] = 1;
    } else {
      result[element] += 1;
    }
  });

  print(result);
}

void main() {
  soalEksplorasi_no1();
  soalEksplorasi_no2();
}
