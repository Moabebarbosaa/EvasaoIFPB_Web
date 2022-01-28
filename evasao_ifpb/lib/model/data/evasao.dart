import 'dart:convert';

class Evasao {
  final int sim;
  final int nao;

  const Evasao({
    required this.sim,
    required this.nao,
  });

  factory Evasao.fromJson(String str) =>
      Evasao.fromMap(json.decode(str));

  factory Evasao.fromMap(Map<String, dynamic> json) {
    return Evasao(
      sim: json["Sim"],
      nao: json["Nao"],
    );
  }

}