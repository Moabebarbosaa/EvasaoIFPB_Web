import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.filter_alt,
              color: Colors.white,
              size: 30,
            ),
            CustomText(
              text: '  Filtros |  ',
              corText: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )
          ],
        )
      ],
    );
  }
}
