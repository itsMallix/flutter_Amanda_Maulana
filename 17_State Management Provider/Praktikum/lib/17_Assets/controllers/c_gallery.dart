import 'package:flutter/material.dart';
import 'package:coba_bloc/17_Assets/models/m_gallery.dart';

class GalleryController extends ChangeNotifier {
  final _gallery = <GalleryModel>[
    GalleryModel(
      name: "Castle In The Sky",
      imagePath: "assets/images/ghibli_castle in the sky.jpg",
      director: "Hayao Miyazaki",
      year: "1986",
    ),
    GalleryModel(
      name: "Grave Of The Fireflies",
      imagePath: "assets/images/ghibli_grave firerlies.jpg",
      director: "Isao Takahata",
      year: "1988",
    ),
    GalleryModel(
      name: "Howl's Moving Castle",
      imagePath: "assets/images/ghibli_howl castle.jpg",
      director: "Hayao Miyazaki",
      year: "2004",
    ),
    GalleryModel(
      name: "Kiki's Delivery",
      imagePath: "assets/images/ghibli_kiki's delivery.jpg",
      director: "Hayao Miyazaki",
      year: "1989",
    ),
    GalleryModel(
      name: "Neighbourhood Totoro",
      imagePath: "assets/images/ghibli_totoro.jpg",
      director: "Hayao Miyazaki",
      year: "1988",
    ),
    GalleryModel(
      name: "Nausicaa Of The Falley",
      imagePath: "assets/images/ghibli_nausicaa.jpg",
      director: "Hayao Miyazaki",
      year: "1987",
    ),
    GalleryModel(
      name: "Ponyo",
      imagePath: "assets/images/ghibli_ponyo.jpg",
      director: "Hayao Miyazaki",
      year: "2008",
    ),
    GalleryModel(
      name: "Spirited Away",
      imagePath: "assets/images/ghibli_spirited away.jpg",
      director: "Hayao Miyazaki",
      year: "2001",
    ),
    GalleryModel(
      name: "The Wind Rises",
      imagePath: "assets/images/ghibli_the wind rises.jpg",
      director: "Hayao Miyazaki",
      year: "2013",
    ),
    GalleryModel(
      name: "Whisper Of The Heart",
      imagePath: "assets/images/ghibli_whisper heart.jpg",
      director: "Hayao Miyazaki",
      year: "1995",
    ),
  ];
  List<GalleryModel> get gallery => _gallery;
}
