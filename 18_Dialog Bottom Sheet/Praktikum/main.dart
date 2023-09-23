import 'package:flutter/material.dart';
import 'dart:async';
import '17_Assets/assets.dart';
import '17_Assets/contact.dart';
import '17_Assets/gallery.dart';
import '17_Assets/gallery_details.dart';
import 'package:coba_flutter/17_Assets/gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // useMaterial3: true,
          fontFamily: 'CeraRoundPro'),
      routes: {
        "|goto_contact": (context) => const Contact(),
        "|goto_gallery": (context) => const Gallery(),
      },
      home: const Assets(),
    );
  }
}
