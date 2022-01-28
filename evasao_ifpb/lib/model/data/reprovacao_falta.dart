import 'dart:convert';

class ReprovacaoFalta {
  final int zero;
  final int um;
  final int dois;
  final int tres;
  final int quatro;
  final int cinco;
  final int seis_dez;
  final int onze_dezesseis;

  const ReprovacaoFalta({
    required this.zero,
    required this.um,
    required this.dois,
    required this.tres,
    required this.quatro,
    required this.cinco,
    required this.seis_dez,
    required this.onze_dezesseis,
  });

  factory ReprovacaoFalta.fromJson(String str) =>
      ReprovacaoFalta.fromMap(json.decode(str));

  factory ReprovacaoFalta.fromMap(Map<String, dynamic> json) {
    return ReprovacaoFalta(
      zero: json["0"],
      um: json["1"],
      dois: json["2"],
      tres: json["3"],
      quatro: json["4"],
      cinco: json["5"],
      seis_dez: json["6-10"],
      onze_dezesseis: json["11-16"],
    );
  }
}