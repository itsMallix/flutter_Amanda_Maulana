import 'dart:convert';

import 'package:coba_ai/constants/open_ai.dart';
import 'package:coba_ai/models/open_ai.dart';
import 'package:coba_ai/models/usage_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RecommendationService {
  static Future<GPTData> getRecommendation(
      {required String camera,
      required String budget,
      required String storage}) async {
    late GPTData gptData = GPTData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: UsageData(
        promptToken: 0,
        completionToken: 0,
        totalTokens: 0,
      ),
    );

    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Charset": "utf-8",
        "Authorization": "Bearer $apiKey",
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp. ',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(budget));

      String promptData =
          "Berikan saya 3 rekomendasi smartphone dengan budget $phoneBudget, spesifikasi kamera $camera dan penyimpanan internal $storage";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "max_tokens": 300,
        "temperature": 0.7,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    return gptData;
  }
}
