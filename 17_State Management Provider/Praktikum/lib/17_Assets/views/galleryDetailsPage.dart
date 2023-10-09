import 'package:coba_bloc/17_Assets/controllers/c_selectedGallery.dart';
import 'package:flutter/material.dart';
import 'package:coba_bloc/17_Assets/component/colors.dart';
import 'package:provider/provider.dart';

class GalleryDetails extends StatelessWidget {
  const GalleryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedImagePath =
        Provider.of<SelectedImageProvider>(context).selectedImagePath;
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
            Image.asset(selectedImagePath),
          ],
        ),
      ),
    );
  }
}
