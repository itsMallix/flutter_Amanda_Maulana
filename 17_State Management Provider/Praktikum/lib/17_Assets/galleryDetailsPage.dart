import 'package:flutter/material.dart';
import 'galleryPage.dart';
import 'package:coba_bloc/17_Assets/models/colors.dart';
import 'package:coba_bloc/17_Assets/models/movie.dart';

class GalleryDetails extends StatelessWidget {
  final ImageData imageData;
  const GalleryDetails({super.key, required this.imageData});

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
