import 'package:coba_ai/models/open_ai.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final GPTData gptResponseData;
  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Rekomendasi Smartphone"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Smartphone Hasil rekomendasi",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                gptResponseData.choices[0].text,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
