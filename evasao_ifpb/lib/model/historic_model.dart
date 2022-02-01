import 'dart:convert';

class HistoricModel {
  final double cre;
  final double risco;
  final int reprovacao_nota;
  final int reprovacao_falta;
  final String periodo;

  const HistoricModel({
    required this.cre,
    required this.risco,
    required this.reprovacao_nota,
    required this.reprovacao_falta,
    required this.periodo,
  });

  factory HistoricModel.fromJson(String str) =>
      HistoricModel.fromMap(json.decode(str));

  factory HistoricModel.fromMap(Map<String, dynamic> json) {
    return HistoricModel(
      cre: json["cre"],
      risco: json["risco"],
      reprovacao_nota: json["reprovacao_nota"],
      reprovacao_falta: json["reprovacao_falta"],
      periodo: json["period_slug"],
    );
  }

  @override
  String toString() {
    return 'HistoricModel{cre: $cre, risco: $risco, reprovacao_nota: $reprovacao_nota, reprovacao_falta: $reprovacao_falta, periodo: $periodo}';
  }
}