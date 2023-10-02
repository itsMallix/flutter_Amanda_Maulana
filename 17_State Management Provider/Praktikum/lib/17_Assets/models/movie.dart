class ImageData {
  final String name;
  final String imagePath;
  final String year;
  final String director;

  ImageData(
      {required this.name,
      required this.imagePath,
      required this.year,
      required this.director});
}

List<ImageData> imageList = [
  ImageData(
    name: "Castle In The Sky",
    imagePath: "assets/images/ghibli_castle in the sky.jpg",
    director: "Hayao Miyazaki",
    year: "1986",
  ),
  ImageData(
    name: "Grave Of The Fireflies",
    imagePath: "assets/images/ghibli_grave firerlies.jpg",
    director: "Isao Takahata",
    year: "1988",
  ),
  ImageData(
    name: "Howl's Moving Castle",
    imagePath: "assets/images/ghibli_howl castle.jpg",
    director: "Hayao Miyazaki",
    year: "2004",
  ),
  ImageData(
    name: "Kiki's Delivery",
    imagePath: "assets/images/ghibli_kiki's delivery.jpg",
    director: "Hayao Miyazaki",
    year: "1989",
  ),
  ImageData(
    name: "Neighbourhood Totoro",
    imagePath: "assets/images/ghibli_totoro.jpg",
    director: "Hayao Miyazaki",
    year: "1988",
  ),
  ImageData(
    name: "Nausicaa Of The Falley",
    imagePath: "assets/images/ghibli_nausicaa.jpg",
    director: "Hayao Miyazaki",
    year: "1987",
  ),
  ImageData(
    name: "Ponyo",
    imagePath: "assets/images/ghibli_ponyo.jpg",
    director: "Hayao Miyazaki",
    year: "2008",
  ),
  ImageData(
    name: "Spirited Away",
    imagePath: "assets/images/ghibli_spirited away.jpg",
    director: "Hayao Miyazaki",
    year: "2001",
  ),
  ImageData(
    name: "The Wind Rises",
    imagePath: "assets/images/ghibli_the wind rises.jpg",
    director: "Hayao Miyazaki",
    year: "2013",
  ),
  ImageData(
    name: "Whisper Of The Heart",
    imagePath: "assets/images/ghibli_whisper heart.jpg",
    director: "Hayao Miyazaki",
    year: "1995",
  ),
];
