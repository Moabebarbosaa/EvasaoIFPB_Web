import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {

  final StudentStore _studentController = GetIt.I<StudentStore>();

  int val = 1;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = 1;
                _studentController.fetchAllStudents('computacao');
              });
            },
            activeColor: Colors.white
          ),
          const CustomText(
            text: 'Engenharia de Computação',
            corText: Colors.white,
            fontSize: 18,
          ),

          const SizedBox(width: 10),
          Radio(
            value: 2,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = 2;
                _studentController.fetchAllStudents('construcao');
              });
            },
            activeColor: Colors.white,
          ),
          const CustomText(
            text: 'Construção de Edifícios',
            corText: Colors.white,
            fontSize: 18,
          ),

          const SizedBox(width: 10),
          Radio(
            value: 3,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = 3;
                _studentController.fetchAllStudents('fisica');
              });
            },
            activeColor: Colors.white,
          ),
          const CustomText(
            text: 'Física',
            corText: Colors.white,
            fontSize: 18,
          ),

          const SizedBox(width: 10),
          Radio(
            value: 4,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = 4;
                _studentController.fetchAllStudents('matematica');
              });
            },
            activeColor: Colors.white,
          ),
          const CustomText(
            text: 'Matemática',
            corText: Colors.white,
            fontSize: 18,
          ),

          const SizedBox(width: 10),
          Radio(
            value: 5,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = 5;
                _studentController.fetchAllStudents('telematica');
              });
            },
            activeColor: Colors.white,
          ),
          const CustomText(
            text: 'Telemática',
            corText: Colors.white,
            fontSize: 18,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

