import 'dart:convert';

class CreModel {
  final int zero_dez;
  final int vinte_quarenta;
  final int quarenta_sessenta;
  final int sessenta_oitenta;
  final int oitenta_cem;

  const CreModel({
    required this.zero_dez,
    required this.vinte_quarenta,
    required this.quarenta_sessenta,
    required this.sessenta_oitenta,
    required this.oitenta_cem,
  });

  factory CreModel.fromJson(String str) =>
      CreModel.fromMap(json.decode(str));

  factory CreModel.fromMap(Map<String, dynamic> json) {
    return CreModel(
      zero_dez: json["zero_dez"],
      vinte_quarenta: json["vinte_quarenta"],
      quarenta_sessenta: json["quarenta_sessenta"],
      sessenta_oitenta: json["sessenta_oitenta"],
      oitenta_cem: json["oitenta_cem"],
    );
  }

}