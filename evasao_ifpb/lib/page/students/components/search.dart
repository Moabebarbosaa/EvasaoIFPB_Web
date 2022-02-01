import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  final StudentStore _studentController = GetIt.I<StudentStore>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 40,
      child: TextField(
        onChanged: _studentController.filterMatricula,
        controller: textEditingController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.5),
          ),
          hintText: 'Filtrar por matrícula...',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white,
          )
        ),
      )
    );
  }
}
