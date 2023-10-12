import 'package:coba_api/eksplorasi/eksplorasi.dart';
import 'package:coba_api/prioritas2/prioritas_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Prioritas2(),
    );
  }
}
