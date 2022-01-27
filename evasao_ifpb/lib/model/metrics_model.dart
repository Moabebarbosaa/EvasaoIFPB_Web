import 'dart:convert';

class MetricsModel {
  final String probability;

  const MetricsModel({
    required this.probability,
  });

  factory MetricsModel.fromJson(String str) =>
      MetricsModel.fromMap(json.decode(str));

  factory MetricsModel.fromMap(Map<String, dynamic> json) {
    return MetricsModel(
      probability: json["probability"],
    );
  }

}