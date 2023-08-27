//  NO 1

soalPrioritas2_no1() {
  List<List<String>> listData = [
    ["Hero", "Benedetta"],
    ["Role", "Assasin/Fighter"],
    ["MMR", "2358"]
  ];

  Map listDataMap = {for (var i in listData) i[0]: i[1]};
  print(listDataMap);
  print("=" * 25);
}

soalPrioritas2_no2() {
  List<int> sampleInput = [1, 2, 3, 5, 5, 7];

  int sum = 0;
  sampleInput.forEach((value) => sum += value);

  double avg = sum / sampleInput.length;
  int result = avg.ceil();

  print("Rata-rata = $avg");
  print("Hasil = $result");
}

void main() {
  soalPrioritas2_no1();
  soalPrioritas2_no2();
}
