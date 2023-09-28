import 'package:flutter/material.dart';
import 'package:coba_flutter/17_Assets/gallery_details.dart';

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

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    Color appbar = const Color(0xff424242);
    Color background = const Color(0xff303030);
    Color primary = const Color(0xff4C9CA3);
    Color alert = Color.fromARGB(255, 163, 76, 76);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Gallery"),
        centerTitle: true,
        backgroundColor: appbar,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: imageList.map(
          (ImageData) {
            return Container(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: appbar,
                        child: SizedBox(
                          height: 300, // ukuran tinggi bottom sheet
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.asset(ImageData.imagePath),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .symmetric(
                                                        horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                child: const Icon(Icons
                                                    .local_movies_rounded)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Text(
                                                ImageData.name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Stack bagian Director
                                      Positioned(
                                        top: 50,
                                        left: 10,
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .symmetric(
                                                        horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                child:
                                                    const Icon(Icons.person)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Text(
                                                ImageData.director,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Stack bagian year
                                      Positioned(
                                        top: 80,
                                        left: 10,
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .symmetric(
                                                        horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                child: const Icon(
                                                    Icons.bar_chart_rounded)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Text(
                                                ImageData.year,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center, // Opsional, tergantung pada kebutuhan Anda
                                  children: [
                                    Container(
                                      width: 100,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: alert,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Back"),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primary,
                                        ),
                                        child: const Text('View Details'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GalleryDetails(
                                                imageData: ImageData,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: appbar, borderRadius: BorderRadius.circular(10.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(children: [
                      Image.asset(ImageData.imagePath),
                      const SizedBox(height: 10.0),
                      Text(
                        ImageData.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        ImageData.director,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        ImageData.year,
                        style: const TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

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
