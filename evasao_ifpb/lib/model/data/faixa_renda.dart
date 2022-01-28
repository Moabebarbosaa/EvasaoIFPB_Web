import 'dart:convert';

class FaixaRenda {
  final int zero_um;
  final int um_doiscinco;
  final int maisDoisCinco;
  final int naoDeclarada;

  const FaixaRenda({
    required this.zero_um,
    required this.um_doiscinco,
    required this.maisDoisCinco,
    required this.naoDeclarada,
  });

  factory FaixaRenda.fromJson(String str) =>
      FaixaRenda.fromMap(json.decode(str));

  factory FaixaRenda.fromMap(Map<String, dynamic> json) {
    return FaixaRenda(
      zero_um: json["0<RFP<=1,0"],
      um_doiscinco: json["1,0<RFP<=2,5"],
      maisDoisCinco: json["RFP > 2,5"],
      naoDeclarada: json["naodeclarada"],
    );
  }
}