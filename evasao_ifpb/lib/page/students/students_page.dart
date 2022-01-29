import 'dart:html';

import 'package:evasao_ifpb/page/students/components/custom_radio.dart';
import 'package:evasao_ifpb/page/students/components/header.dart';
import 'package:evasao_ifpb/page/students/components/search.dart';
import 'package:evasao_ifpb/page/students/components/student_card.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/generate_rows.dart';

class StudentsPage extends StatelessWidget {
  StudentsPage({Key? key}) : super(key: key);

  final StudentStore _studentController = GetIt.I<StudentStore>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                elevation: 20,
                color: Colors.green,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 30, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomRadio(),
                        Search(),
                      ],
                    ),
                  ),
                ),
              ),
              const Card(
                  color: Colors.green,
                  elevation: 20,
                  child: SizedBox(height: 40, child: Header())),
            ],
          ),
        ),
        Observer(builder: (_) {
          return _studentController.loadingStudentPage
              ? SizedBox(
                  height: size.height - 240,
                  child: const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                )
              : SizedBox(
                  height: size.height - 240,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _studentController.students.length,
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      itemBuilder: (BuildContext context, int index) {
                        final student = _studentController.students[index];
                        return StudentCard(student: student);
                      }),
                );
        })
      ],
    );
  }
}
