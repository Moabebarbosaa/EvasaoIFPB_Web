import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.green),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image.asset(
            'assets/images/ifpb.png',
            height: 25,
            alignment: Alignment.topCenter,
          ),
          const SizedBox(width: 5),
          const CustomText(
              text: 'PROJETO - EVASÃO',
            corText: Colors.black,
          ),
        ],
      ),
    );
  }
}
