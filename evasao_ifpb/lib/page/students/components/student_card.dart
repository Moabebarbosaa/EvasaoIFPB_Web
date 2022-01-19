import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/model/student_model.dart';
import 'package:flutter/material.dart';

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
      onTap: () {
        // todo: Colocar aqui o JumpToPage de detail do student
        print(student.id);
      },
    );
  }
}
