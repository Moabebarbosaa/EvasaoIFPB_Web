import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/graph/build_graph.dart';
import 'package:evasao_ifpb/model/student_model.dart';
import 'package:evasao_ifpb/page/students/components/show_dialog.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class StudentCard extends StatelessWidget {

  final StudentModel student;
  final StudentStore _studentController = GetIt.I<StudentStore>();

  StudentCard({
    Key? key,
    required this.student
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _studentController.fetchStudentById(student.id);
        showGeneralDialog(
          barrierDismissible: false,
          context: context,
          barrierColor: Colors.black54,
          transitionDuration: const Duration(milliseconds: 400),
          transitionBuilder: (context, a1, a2, child) {
            BuildGraph buildGraph = BuildGraph(context);
            return bodyShowDialog(a1, buildGraph);
          },
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return const Center();
          },
        );
      },
      child: Card(
          elevation: 20,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                  text: student.matricula!,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                CustomText(text: student.curso!),
                CustomText(text: student.cre.toString()),
                CustomText(text: student.idade.toString()),
                CustomText(text: 'Risco de Evasão'),
              ],
            ),
          ),
        ),
    );
  }
}
