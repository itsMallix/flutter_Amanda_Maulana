//  NO 1

soalPrioritas2_no1() {
  List<List<String>> listData = [
    //formatting list
    ["Hero", "Benedetta"],
    ["Role", "Assasin/Fighter"],
    ["MMR", "2358"]
  ];

  Map listDataMap = {
    for (var i in listData) i[0]: i[1]
  }; // lakukan perulangan dan definisikan elemen mana yang akan jadi key
  print(listDataMap);
  print("=" * 25);
}

soalPrioritas2_no2() {
  List<int> sampleInput = [1, 2, 3, 5, 5, 7];

  int sum = 0;
  sampleInput.forEach((value) => sum += value); //cari total nilai dari list

  double avg = sum / sampleInput.length; // cari rata-rata
  int result = avg.ceil(); // pembulatan ke atas

  print("Rata-rata = $avg");
  print("Hasil = $result");
  print("=" * 25);
}

void main() {
  soalPrioritas2_no1();
  soalPrioritas2_no2();
}
