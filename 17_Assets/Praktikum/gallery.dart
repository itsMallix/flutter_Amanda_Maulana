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
    Color appbar = Color(0xff424242);
    Color background = Color(0xff303030);
    Color primary = Color(0xff4C9CA3);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Gallery"),
        centerTitle: true,
        backgroundColor: appbar,
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: imageList.map(
          (ImageData) {
            return Container(
              padding: EdgeInsetsDirectional.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        color: appbar,
                        child: SizedBox(
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.0),
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
                                                margin: EdgeInsetsDirectional
                                                    .symmetric(horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                child: Icon(Icons
                                                    .local_movies_rounded)),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Text(
                                                ImageData.name,
                                                style: TextStyle(
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
                                                margin: EdgeInsetsDirectional
                                                    .symmetric(horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                child: Icon(Icons.person)),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Text(
                                                ImageData.director,
                                                style: TextStyle(
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
                                                margin: EdgeInsetsDirectional
                                                    .symmetric(horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.white
                                                        .withOpacity(0.8)),
                                                child: Icon(
                                                    Icons.bar_chart_rounded)),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                              child: Text(
                                                ImageData.year,
                                                style: TextStyle(
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
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primary),
                                  child: const Text('View Details'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GalleryDetails(
                                            imageData: ImageData),
                                      ),
                                    );
                                  },
                                ),
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
                      SizedBox(height: 10.0),
                      Text(
                        ImageData.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        ImageData.director,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        ImageData.year,
                        style: TextStyle(color: Colors.white),
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
