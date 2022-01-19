import 'dart:convert';

import 'package:evasao_ifpb/model/student_model.dart';

class AllStudentsModel {
  final List<StudentModel> students;

  AllStudentsModel({
    required this.students,
  });

  factory AllStudentsModel.fromJson(String str) =>
      AllStudentsModel.fromMap(json.decode(str));

  factory AllStudentsModel.fromMap(Map<String, dynamic> json) =>
      AllStudentsModel(
        students: List<StudentModel>.from(
            json["result"].map((x) => StudentModel.fromMap(x)
            )
        ),
      );
}
