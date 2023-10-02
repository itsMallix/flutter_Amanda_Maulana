import 'package:coba_bloc/17_Assets/galleryDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:coba_bloc/17_Assets/models/movie.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    Color appbar = const Color(0xff424242);
    Color background = const Color(0xff303030);
    Color primary = const Color(0xff4C9CA3);
    Color alert = const Color.fromARGB(255, 163, 76, 76);

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
                                    //here
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
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center, // Opsional, tergantung pada kebutuhan Anda
                                  children: [
                                    Container(
                                      width: 100,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
