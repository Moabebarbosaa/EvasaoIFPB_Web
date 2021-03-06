import 'package:evasao_ifpb/page/base/base_page.dart';
import 'package:evasao_ifpb/page/login/login_page.dart';
import 'package:evasao_ifpb/page/students/students_page.dart';
import 'package:evasao_ifpb/store/home_store.dart';
import 'package:evasao_ifpb/store/page_store.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(StudentStore());
  GetIt.I.registerSingleton(HomeStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.green,
      title: "Evasão IFPB-CG",
      debugShowCheckedModeBanner: false,
      // home: LoginScreen()//LoginScreen(),
      home: BasePage(),
    );
  }
}
