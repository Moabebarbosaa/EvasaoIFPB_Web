import 'dart:convert';

import 'package:evasao_ifpb/model/data/cre.dart';
import 'package:evasao_ifpb/model/data/enem.dart';
import 'package:evasao_ifpb/model/data/faixa_renda.dart';
import 'package:evasao_ifpb/model/data/reprovacao_falta.dart';

import 'data/cota.dart';
import 'data/evasao.dart';
import 'data/idade.dart';
import 'data/reprovacao_nota.dart';
import 'data/sexo.dart';

class DataModel {
  final int total;
  final Cre cre;
  final Cota cota;
  final Evasao evasao;
  final Idade idade;
  final Sexo sexo;
  final Enem mediaEnem;
  final FaixaRenda faixaRenda;
  final ReprovacaoFalta reprovacaoFalta;
  final ReprovacaoNota reprovacaoNota;
  final Enem matematicaEnem;

  const DataModel({
    required this.total,
    required this.cre,
    required this.cota,
    required this.evasao,
    required this.idade,
    required this.sexo,
    required this.mediaEnem,
    required this.faixaRenda,
    required this.reprovacaoFalta,
    required this.reprovacaoNota,
    required this.matematicaEnem,
  });

  factory DataModel.fromJson(String str) =>
      DataModel.fromMap(json.decode(str));

  factory DataModel.fromMap(Map<String, dynamic> json) {
    return DataModel(
      total: json['total'],
      cre: Cre.fromMap(json["cre"]),
      cota: Cota.fromMap(json["cota"]),
      evasao: Evasao.fromMap(json["evasao"]),
      idade: Idade.fromMap(json["idade"]),
      sexo: Sexo.fromMap(json["sexo"]),
      mediaEnem: Enem.fromMap(json["notaEnem"]),
      faixaRenda: FaixaRenda.fromMap(json["faixaRenda"]),
      reprovacaoFalta: ReprovacaoFalta.fromMap(json["reprovacaoFalta"]),
      reprovacaoNota: ReprovacaoNota.fromMap(json["reprovacaoNota"]),
      matematicaEnem: Enem.fromMap(json["notaMatematica"]),
    );
  }

}