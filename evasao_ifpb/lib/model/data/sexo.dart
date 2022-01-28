import 'dart:convert';

class Sexo {
  final int masculino;
  final int feminino;

  const Sexo({
    required this.masculino,
    required this.feminino,
  });

  factory Sexo.fromJson(String str) =>
      Sexo.fromMap(json.decode(str));

  factory Sexo.fromMap(Map<String, dynamic> json) {
    return Sexo(
      masculino: json["Masculino"],
      feminino: json["Feminino"],
    );
  }

}