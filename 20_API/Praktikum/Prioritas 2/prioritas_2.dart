import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Prioritas2 extends StatefulWidget {
  const Prioritas2({super.key});

  @override
  State<Prioritas2> createState() => _Prioritas2State();
}

class _Prioritas2State extends State<Prioritas2> {
  final List<String> imageModel = [
    "https://api.dicebear.com/7.x/pixel-art/svg",
  ];
  List<String> loadImageModel = [];

  final Dio dio = Dio();

  Future<void> fetchAPI() async {
    for (final i in imageModel) {
      try {
        final response = await dio.get(i);
        if (response.statusCode == 200) {
          loadImageModel.add(i);
        } else {
          print("failed to load image : $i");
        }
      } catch (err) {
        print("error found : $err");
      }
    }
  }

  @override
  void initState() {
    fetchAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dicebar API",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
          child: loadImageModel.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final i in imageModel)
                      SvgPicture.network(
                        i,
                        width: 50,
                        height: 50,
                        placeholderBuilder: (context) =>
                            const CircularProgressIndicator(),
                      )
                  ],
                )
              : CircularProgressIndicator()),
    );
  }
}
