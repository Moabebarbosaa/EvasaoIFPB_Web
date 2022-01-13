import 'dart:convert';

class StudentModel {
  final String id;
  final String matricula;
  final String curso;
  final double cre;
  final int idade;

  const StudentModel({
    required this.id,
    required this.matricula,
    required this.curso,
    required this.cre,
    required this.idade
  });

  factory StudentModel.fromJson(String str) =>
      StudentModel.fromMap(json.decode(str));

  factory StudentModel.fromMap(Map<String, dynamic> json) {
    return StudentModel(
      id: json["id"],
      matricula: json["matricula"],
      curso: json["curso"],
      cre: json["cre"],
      idade: json["idade"],
    );
  }

}