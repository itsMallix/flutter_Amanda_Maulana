import 'package:flutter/material.dart';
import '16_Code Competence/codeCompetence_1.dart';
import '15_advanced form/advancedForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // useMaterial3: true,
          fontFamily: 'CeraRoundPro'),
      home: const AdvanceForm(),
    );
  }
}
