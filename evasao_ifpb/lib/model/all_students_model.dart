import 'dart:convert';

import 'package:evasao_ifpb/model/student_model.dart';

class AllStudentsModel {
  final List<StudentModel> students;

  AllStudentsModel({
    required this.students,
  });

  factory AllStudentsModel.fromJson(String str) =>
      AllStudentsModel.fromMap(json.decode(str));

  factory AllStudentsModel.fromMap(List<dynamic> json) =>
      AllStudentsModel(
        students: List<StudentModel>.from(
            json.map((x) => StudentModel.fromMap(x))),
      );

  @override
  String toString() {
    return 'PopularMoviesModel{movies: $students}';
  }
}
