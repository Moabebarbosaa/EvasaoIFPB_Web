import 'package:evasao_ifpb/page/students/components/search.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../components/custom_text.dart';
import '../../../store/student_store.dart';
import 'custom_radio.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({Key? key}) : super(key: key);

  final StudentStore _studentController = GetIt.I<StudentStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Center(
        child: Card(
          elevation: 20,
          color: Colors.green,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(30),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const CustomRadio(),
                Search(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
