import 'dart:convert';

class Cota {
  final int sim;
  final int nao;

  const Cota({
    required this.sim,
    required this.nao,
  });

  factory Cota.fromJson(String str) =>
      Cota.fromMap(json.decode(str));

  factory Cota.fromMap(Map<String, dynamic> json) {
    return Cota(
      sim: json["Sim"],
      nao: json["Nao"],
    );
  }

}