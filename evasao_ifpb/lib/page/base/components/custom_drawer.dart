import 'package:evasao_ifpb/page/login/login_page.dart';
import 'package:evasao_ifpb/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/ifpb.png',
                height: 70,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          ListTile(
            title: const Text('HOME'),
            onTap: () {
              pageStore.page = 0;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('ALUNOS'),
            onTap: () {
              pageStore.page = 1;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('PROBABILIDADE'),
            onTap: () {
              pageStore.page = 2;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('SAIR'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const LoginScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
