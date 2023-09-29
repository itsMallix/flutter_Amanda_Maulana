class TalendData {
  final String name;
  final String description;
  final String method;
  final String imagePath;
  final int salary;

  TalendData(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.method,
      required this.salary});

  static List<TalendData> dataList1 = [
    TalendData(
      name: "SHOESCARE",
      description:
          "Butuh jasa foto sepatu dan edit foto produk kami mengenai prduk sandal dan sepatu dari toko SHOESCARE",
      imagePath: "assets/images/talend_shoescare.png",
      method: "Online",
      salary: 250000,
    ),
    TalendData(
      name: "ABOOM",
      description:
          "Dibutuhkan admin instagram yang jago ngelola feed instagram kami",
      imagePath: "assets/images/talend_aboom.png",
      method: "Online",
      salary: 100000,
    ),
    TalendData(
      name: "ABONWOW",
      description: "Dibutuhkan video editor untuk video promosi abon kami",
      imagePath: "assets/images/talend_abonwow.png",
      method: "Offline",
      salary: 175000,
    ),
  ];

  static List<TalendData> dataList2 = [
    TalendData(
      name: "MAMA FUJI",
      description:
          "Butuh jasa pembuatan logo dan banner warung untuk mama fuji xyz",
      imagePath: "assets/images/talend_fuji.png",
      method: "Online",
      salary: 250000,
    ),
    TalendData(
      name: "EATMIE",
      description:
          "Dibutuhkan fotografer untuk dokumentasi grand opening eatmie di jember",
      imagePath: "assets/images/talend_eatmi.png",
      method: "Online",
      salary: 15000,
    ),
    TalendData(
      name: "KHAF",
      description:
          "Dibutuhkan jasa foto produk dan editing video produk untuk promosi di instagram dan poster",
      imagePath: "assets/images/talend_khaf.png",
      method: "Offline",
      salary: 200000,
    ),
  ];
}
