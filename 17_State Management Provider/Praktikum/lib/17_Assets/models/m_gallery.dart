import 'package:flutter/material.dart';

class GalleryModel {
  final String name;
  final String imagePath;
  final String year;
  final String director;

  GalleryModel(
      {required this.name,
      required this.imagePath,
      required this.year,
      required this.director});
}
