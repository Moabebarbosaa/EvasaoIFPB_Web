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

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          const SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                  value: 0,
                  groupValue: _studentController.valorRatio,
                  onChanged: (value) {
                    setState(() {
                      _studentController.setValorRatio(0);
                      _studentController.fetchAllStudents('');
                    });
                  },
                  activeColor: Colors.white
              ),
              const CustomText(
                text: 'Todos os Cursos',
                corText: Colors.white,
                fontSize: 18,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                  value: 1,
                  groupValue: _studentController.valorRatio,
                  onChanged: (value) {
                    setState(() {
                      _studentController.setValorRatio(1);
                      _studentController.fetchAllStudents('?curso=computacao');
                    });
                  },
                  activeColor: Colors.white
              ),
              const CustomText(
                text: 'Engenharia de Computação',
                corText: Colors.white,
                fontSize: 18,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                value: 2,
                groupValue: _studentController.valorRatio,
                onChanged: (value) {
                  setState(() {
                    _studentController.setValorRatio(2);
                    _studentController.fetchAllStudents('?curso=construcao');
                  });
                },
                activeColor: Colors.white,
              ),
              const CustomText(
                text: 'Construção de Edifícios',
                corText: Colors.white,
                fontSize: 18,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                value: 3,
                groupValue: _studentController.valorRatio,
                onChanged: (value) {
                  setState(() {
                    _studentController.setValorRatio(3);
                    _studentController.fetchAllStudents('?curso=fisica');
                  });
                },
                activeColor: Colors.white,
              ),
              const CustomText(
                text: 'Física',
                corText: Colors.white,
                fontSize: 18,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                value: 4,
                groupValue: _studentController.valorRatio,
                onChanged: (value) {
                  setState(() {
                    _studentController.setValorRatio(4);
                    _studentController.fetchAllStudents('?curso=matematica');
                  });
                },
                activeColor: Colors.white,
              ),
              const CustomText(
                text: 'Matemática',
                corText: Colors.white,
                fontSize: 18,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                value: 5,
                groupValue: _studentController.valorRatio,
                onChanged: (value) {
                  setState(() {
                    _studentController.setValorRatio(5);
                    _studentController.fetchAllStudents('?curso=telematica');
                  });
                },
                activeColor: Colors.white,
              ),
              const CustomText(
                text: 'Telemática',
                corText: Colors.white,
                fontSize: 18,
              ),
            ],
          ),

          const SizedBox(width: 10),

        ],
      ),
    );
  }
}

