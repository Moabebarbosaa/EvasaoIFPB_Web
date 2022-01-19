import 'dart:html';

import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CustomText(
          text: 'MATRÍCULA',
          corText: Colors.white,
        ),
        CustomText(
          text: '                   CURSO',
          corText: Colors.white,
        ),
        CustomText(
          text: '                     CRE',
          corText: Colors.white,
        ),
        CustomText(
          text: 'IDADE',
          corText: Colors.white,
        ),
      ],
    );
  }
}
