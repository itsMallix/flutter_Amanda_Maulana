import 'package:flutter/material.dart';
import 'package:coba_flutter/17_Assets/gallery.dart';

Color appbar = Color(0xff424242);
Color background = Color(0xff303030);
Color primary = Color(0xff4C9CA3);

class GalleryDetails extends StatelessWidget {
  final ImageData imageData;

  GalleryDetails({required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Gallery Details"),
        centerTitle: true,
        backgroundColor: appbar,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(imageData.imagePath),
          ],
        ),
      ),
    );
  }
}
