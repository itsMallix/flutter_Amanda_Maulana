import 'package:flutter/material.dart';
// import '17_Assets/assets.dart';
// import '17_Assets/contact.dart';
// import '17_Assets/gallery.dart';
// import '17_Assets/gallery_details.dart';
// import '15_advanced form/prioritas2_Eksplorasi.dart';
import '16_Code Competence/codeCompetence_1.dart';

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
      home: const CodeCompentence1(),
    );
  }
}
