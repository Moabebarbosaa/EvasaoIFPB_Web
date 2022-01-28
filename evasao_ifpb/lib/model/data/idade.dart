import 'dart:convert';

class Idade {
  final int quinze_vintedois;
  final int vintedois_vinteoito;
  final int vinteoito_trintacinco;
  final int trintacinco_quarentadois;
  final int quarentadois_ciquenta;
  final int ciquentaMais;

  const Idade({
    required this.quinze_vintedois,
    required this.vintedois_vinteoito,
    required this.vinteoito_trintacinco,
    required this.trintacinco_quarentadois,
    required this.quarentadois_ciquenta,
    required this.ciquentaMais,
  });

  factory Idade.fromJson(String str) =>
      Idade.fromMap(json.decode(str));

  factory Idade.fromMap(Map<String, dynamic> json) {
    return Idade(
      quinze_vintedois: json["15-22"],
      vintedois_vinteoito: json["22-28"],
      vinteoito_trintacinco: json["28-35"],
      trintacinco_quarentadois: json["35-42"],
      quarentadois_ciquenta: json["42-50"],
      ciquentaMais: json["50+"],
    );
  }

}