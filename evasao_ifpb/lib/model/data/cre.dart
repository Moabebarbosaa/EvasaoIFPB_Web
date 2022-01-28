import 'dart:convert';

class Cre {
  final int zero_vinte;
  final int vinte_quarenta;
  final int quarenta_sessenta;
  final int sessenta_oitenta;
  final int oitenta_cem;

  const Cre({
    required this.zero_vinte,
    required this.vinte_quarenta,
    required this.quarenta_sessenta,
    required this.sessenta_oitenta,
    required this.oitenta_cem,
  });

  factory Cre.fromJson(String str) =>
      Cre.fromMap(json.decode(str));

  factory Cre.fromMap(Map<String, dynamic> json) {
    return Cre(
      zero_vinte: json["0-20"],
      vinte_quarenta: json["20-40"],
      quarenta_sessenta: json["40-60"],
      sessenta_oitenta: json["60-80"],
      oitenta_cem: json["80-100"],
    );
  }

}