import 'package:evasao_ifpb/page/base/components/custom_drawer.dart';
import 'package:evasao_ifpb/page/base/components/mobile_app_bar.dart';
import 'package:evasao_ifpb/page/base/components/web_app_bar.dart';
import 'package:evasao_ifpb/page/home/home_page.dart';
import 'package:evasao_ifpb/page/login/login_page.dart';
import 'package:evasao_ifpb/page/metrics/metrics_page.dart';
import 'package:evasao_ifpb/page/students/students_page.dart';
import 'package:evasao_ifpb/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    reaction((_) => pageStore.page,
        (page) => pageController.jumpToPage(int.parse(page.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: constraints.maxWidth < 900
            ? const PreferredSize(
            child: MobileAppBar(),
            preferredSize: Size(double.infinity, 56))
            : PreferredSize(
          child: WebAppBar(),
          preferredSize: const Size(double.infinity, 72),
        ),
        drawer: constraints.maxWidth < 900 ? CustomDrawer() : null,
        backgroundColor: Colors.green,
        body: Observer(builder: (_) {
           if (pageStore.page == 0) {
             return HomePage();
           } else if (pageStore.page == 1) {
            return StudentsPage();
          } else if (pageStore.page == 2) {
            return MetricsPage();
          } else {
             return Container();
           }
        })
      );
    });
  }
}
