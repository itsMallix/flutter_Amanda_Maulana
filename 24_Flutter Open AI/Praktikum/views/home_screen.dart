import 'package:coba_ai/services/recommendation.dart';
import 'package:coba_ai/views/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _budgetController = TextEditingController();
  final _cameraController = TextEditingController();
  final _storageController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendation(
        budget: _budgetController.text,
        camera: _cameraController.text,
        storage: _storageController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            gptResponseData: result,
          ),
        ),
      );
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Gagal mendapatkan rekomendasi'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Smartphone Recommendation"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Rekomendasi Smartphone Berbasis AI",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _budgetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Masukkan Budget",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan budget';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _cameraController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Masukkan Spesifikasi Kamera (MP)",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Spesifikasi Kamera';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _storageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Masukkan Spesifikasi Storage",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Spesifikasi Storage';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _getRecommendations();
                            }
                          },
                          child: const Text("Dapat Rekomendasi"),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
