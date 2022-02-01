import 'dart:convert';

import 'package:evasao_ifpb/model/historic_model.dart';

class StudentModel {
  final int id;
  final String? matricula;
  final String? curso;
  final double? cre;
  final int? idade;
  final int? periodo_atual;
  final int? ano_ingresso;
  final String? sit_ultimo_periodo;
  final String? faixa_renda;
  final double? nu_nota_m;
  final double? nu_nota_r;
  final int? cota;
  final double? nu_media;
  final int? reprovacao_nota;
  final int? reprovacao_falta;
  final String? cidade;
  final List<HistoricModel>? historic;


  const StudentModel({
    required this.id,
    required this.matricula,
    required this.curso,
    required this.cre,
    required this.idade,
    required this.periodo_atual,
    required this.ano_ingresso,
    required this.sit_ultimo_periodo,
    required this.faixa_renda,
    required this.nu_nota_m,
    required this.nu_nota_r,
    required this.cota,
    required this.nu_media,
    required this.reprovacao_nota,
    required this.reprovacao_falta,
    required this.cidade,
    required this.historic
  });

  factory StudentModel.fromJson(String str) =>
      StudentModel.fromMap(json.decode(str));

  factory StudentModel.fromMap(Map<String, dynamic> json) {
    return StudentModel(
      id: json["id"],
      matricula: json["matricula"],
      curso: json["curso"],
      cre: json['cre'],
      idade: json["idade"],
      periodo_atual: json["periodo_atual"],
      ano_ingresso: json["ano_ingresso"],
      sit_ultimo_periodo: json["sit_ultimo_periodo"],
      faixa_renda: json["faixa_renda"],
      nu_nota_m: json["nu_nota_m"],
      nu_nota_r: json["nu_nota_r"],
      cota: json["cota"],
      nu_media: json['nu_media'],
      reprovacao_nota: json['reprovacao_nota'],
      reprovacao_falta: json['reprovacao_falta'],
      cidade: json['cidade'],
      historic: List<HistoricModel>.from(
          json["historic"].map((x) => HistoricModel.fromMap(x))),
    );
  }

  @override
  String toString() {
    return 'StudentModel{matricula: $matricula, curso: $curso, historic: $historic}';
  }
}