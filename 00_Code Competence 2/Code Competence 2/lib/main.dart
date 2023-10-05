import 'package:flutter/material.dart';
import '16_Code Competence/view/codeCompetence_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'CeraRoundPro'),
      home: const CodeCompentence1(),
    );
  }
}
