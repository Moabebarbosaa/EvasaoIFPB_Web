import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/store/home_store.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {

  final HomeStore _studentController = GetIt.I<HomeStore>();

  int val = 0;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Radio(
              value: 0,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = 0;
                  _studentController.fetchDataAllCourse('');
                });
              },
              activeColor: Colors.white
          ),
          const CustomText(
            text: 'Todos os Cursos',
            corText: Colors.white,
            fontSize: 18,
          ),

          const SizedBox(width: 10),
          Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = 1;
                  _studentController.fetchDataAllCourse('?curso=computacao');
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
                _studentController.fetchDataAllCourse('?curso=construcao');
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
                _studentController.fetchDataAllCourse('?curso=fisica');
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
                _studentController.fetchDataAllCourse('?curso=matematica');
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
                _studentController.fetchDataAllCourse('?curso=telematica');
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

