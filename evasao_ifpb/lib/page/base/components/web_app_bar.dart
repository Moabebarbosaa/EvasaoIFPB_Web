import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/page/base/components/menu_item.dart';
import 'package:evasao_ifpb/page/login/login_page.dart';
import 'package:evasao_ifpb/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class WebAppBar extends StatelessWidget {
  WebAppBar({Key? key}) : super(key: key);

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.16)
            )
          ]
      ),
      child: Observer(builder: (_){
        return Row(
          children: [
            Image.asset(
              'assets/images/ifpb.png',
              height: 25,
              alignment: Alignment.topCenter,
            ),
            const SizedBox(width: 5),
            CustomText(
              text: "PROJETO - EVASÃO".toUpperCase(),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            MenuItem(
              title: "Home",
              onPressed: () {
                pageStore.page = 0;
              },
              selected: pageStore.page == 0 ? true : false,
            ),
            MenuItem(
              title: "Alunos",
              onPressed: () {
                pageStore.page = 1;
              },
              selected: pageStore.page == 1 ? true : false,
            ),
            MenuItem(
              title: "Probabilidade",
              onPressed: () {
                pageStore.page = 2;
              },
              selected: pageStore.page == 2 ? true : false,
            ),
            MenuItem(
              title: "Sair",
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const LoginScreen(),
                ));
              },
              selected: pageStore.page == 3 ? true : false,
            ),
          ],
        );
      })
    );
  }
}