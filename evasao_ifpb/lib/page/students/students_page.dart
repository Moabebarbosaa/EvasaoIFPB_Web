import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class StudentsPage extends StatelessWidget {
  StudentsPage({Key? key}) : super(key: key);

  final StudentStore _studentController = GetIt.I<StudentStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Observer(builder: (_) {
          if (_studentController.loadingStudentPage) {
            return  const CircularProgressIndicator();
          } else {
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 100,
              padding: const EdgeInsets.only(left: 20),
              itemBuilder: (BuildContext context, int index) {
                final student = _studentController.students[index];
                return Row(
                  children: [
                    CustomText(text: 'Matrícula: ${student.matricula}'),
                    CustomText(text: '   Idade: ${student.idade}'),
                    CustomText(text: '   CRE: ${student.cre}'),
                  ],
                );
              }
          );
          }
        })
      ],
    );
  }
}
