import 'package:evasao_ifpb/page/base/components/app_bar.dart';
import 'package:evasao_ifpb/page/home/home_page.dart';
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
    reaction((_) => pageStore.page,
            (page) => pageController.jumpToPage(int.parse(page.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            children: [
              CustomAppBar(),
              if (pageStore.page == 0)
                const HomePage()
              else if (pageStore.page == 1)
                StudentsPage()
              else if (pageStore.page == 2)
                  Container(
                    height: 200,
                    color: Colors.blue,
                  )
                else
                  Column(
                    children: [
                      Container(
                        height: 200,
                        color: Colors.blueGrey,
                      ),
                      Container(
                        height: 200,
                        color: Colors.red,
                      ),
                      Container(
                        height: 200,
                        color: Colors.orange,
                      ),
                      Container(
                        height: 200,
                        color: Colors.pink,
                      ),
                      Container(
                        height: 200,
                        color: Colors.yellow,
                      ),

                    ],
                  )
            ],
          )
      );
    });
  }
}