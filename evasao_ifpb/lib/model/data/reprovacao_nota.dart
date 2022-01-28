import 'dart:convert';

class ReprovacaoNota {
  final int zero;
  final int um;
  final int dois;
  final int tres;
  final int quatro;
  final int cinco;
  final int seis_dez;
  final int onze_quatorze;
  final int quinze_vintecinco;

  const ReprovacaoNota({
    required this.zero,
    required this.um,
    required this.dois,
    required this.tres,
    required this.quatro,
    required this.cinco,
    required this.seis_dez,
    required this.onze_quatorze,
    required this.quinze_vintecinco,
  });

  factory ReprovacaoNota.fromJson(String str) =>
      ReprovacaoNota.fromMap(json.decode(str));

  factory ReprovacaoNota.fromMap(Map<String, dynamic> json) {
    return ReprovacaoNota(
      zero: json["0"],
      um: json["1"],
      dois: json["2"],
      tres: json["3"],
      quatro: json["4"],
      cinco: json["5"],
      seis_dez: json["6-10"],
      onze_quatorze: json["11-14"],
      quinze_vintecinco: json["15-25"],
    );
  }
}