import 'dart:convert';

import 'package:coba_ai/models/choice_model.dart';
import 'package:coba_ai/models/usage_model.dart';

GPTData gptDataFromJson(String str) => GPTData.fromJson(json.decode(str));

String gptDataToJson(GPTData data) => json.encode(data.toJson());

class GPTData {
  String id;
  String object;
  int created;
  String model;
  List<ChoiceData> choices;
  UsageData usage;

  GPTData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory GPTData.fromJson(Map<String, dynamic> json) => GPTData(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: List<ChoiceData>.from(json["choices"].map(
          (x) => ChoiceData.fromJson(x),
        )),
        usage: UsageData.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}
