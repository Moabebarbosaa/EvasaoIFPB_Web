import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/model/student_model.dart';
import 'package:evasao_ifpb/page/students/components/show_dialog.dart';
import 'package:flutter/material.dart';

import 'custom_dialog.dart';

class StudentCard extends StatelessWidget {

  final StudentModel student;

  const StudentCard({
    Key? key,
    required this.student
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 20,
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                text: student.matricula,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              CustomText(text: student.curso),
              CustomText(text: student.cre.toString()),
              CustomText(text: student.idade.toString()),
            ],
          ),
        ),
      ),
      onTap: () => showGeneralDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Colors.black54,
        transitionDuration: Duration(milliseconds: 400),
        transitionBuilder: (context, a1, a2, child) {
          return bodyShowDialog(a1);
        },
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return Center();
        },
      ),
    );
  }
}
