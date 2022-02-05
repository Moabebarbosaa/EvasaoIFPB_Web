import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomRadioCourse extends StatefulWidget {
  const CustomRadioCourse({Key? key}) : super(key: key);

  @override
  State<CustomRadioCourse> createState() => _CustomRadioCourseState();
}

class _CustomRadioCourseState extends State<CustomRadioCourse> {
  final HomeStore _studentController = GetIt.I<HomeStore>();

  int course = 0;
  int evasao = -1;
  String rota = '';
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: 0,
                      groupValue: course,
                      onChanged: (value) {
                        setState(() {
                          course = 0;
                          _studentController.fetchDataAllCourse('');
                        });
                      },
                      activeColor: Colors.white),
                  const CustomText(
                    text: 'Todos os Cursos',
                    corText: Colors.white,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: 1,
                      groupValue: course,
                      onChanged: (value) {
                        setState(() {
                          course = 1;
                          rota = 'curso=computacao';
                          if (evasao == 1) {
                            _studentController
                                .fetchDataAllCourse('curso=computacao&evasao=1');
                          } else if (evasao == 0) {
                            _studentController
                                .fetchDataAllCourse('curso=computacao&evasao=0');
                          } else {
                            _studentController
                                .fetchDataAllCourse('curso=computacao');
                          }
                        });
                      },
                      activeColor: Colors.white),
                  const CustomText(
                    text: 'Engenharia de Computação',
                    corText: Colors.white,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: 2,
                    groupValue: course,
                    onChanged: (value) {
                      setState(() {
                        course = 2;
                        rota = 'curso=construcao';
                        if (evasao == 1) {
                          _studentController
                              .fetchDataAllCourse('curso=construcao&evasao=1');
                        } else if (evasao == 0) {
                          _studentController
                              .fetchDataAllCourse('curso=construcao&evasao=0');
                        } else {
                          _studentController.fetchDataAllCourse('curso=construcao');
                        }
                      });
                    },
                    activeColor: Colors.white,
                  ),
                  const CustomText(
                    text: 'Construção de Edifícios',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: 3,
                    groupValue: course,
                    onChanged: (value) {
                      setState(() {
                        course = 3;
                        rota = 'curso=fisica';
                        if (evasao == 1) {
                          _studentController
                              .fetchDataAllCourse('curso=fisica&evasao=1');
                        } else if (evasao == 0) {
                          _studentController
                              .fetchDataAllCourse('curso=fisica&evasao=0');
                        } else {
                          _studentController.fetchDataAllCourse('curso=fisica');
                        }
                      });
                    },
                    activeColor: Colors.white,
                  ),
                  const CustomText(
                    text: 'Física',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: 4,
                    groupValue: course,
                    onChanged: (value) {
                      setState(() {
                        course = 4;
                        rota = 'curso=matematica';
                        if (evasao == 1) {
                          _studentController
                              .fetchDataAllCourse('curso=matematica&evasao=1');
                        } else if (evasao == 0) {
                          _studentController
                              .fetchDataAllCourse('curso=matematica&evasao=0');
                        } else {
                          _studentController.fetchDataAllCourse('curso=matematica');
                        }
                      });
                    },
                    activeColor: Colors.white,
                  ),
                  const CustomText(
                    text: 'Matemática',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: 5,
                    groupValue: course,
                    onChanged: (value) {
                      setState(() {
                        course = 5;
                        rota = 'curso=telematica';
                        if (evasao == 1) {
                          _studentController
                              .fetchDataAllCourse('curso=telematica&evasao=1');
                        } else if (evasao == 0) {
                          _studentController
                              .fetchDataAllCourse('curso=telematica&evasao=0');
                        } else {
                          _studentController.fetchDataAllCourse('curso=telematica');
                        }
                      });
                    },
                    activeColor: Colors.white,
                  ),
                  const CustomText(
                    text: 'Telemática',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.white,),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    value: -1,
                    groupValue: evasao,
                    onChanged: (value) {
                      setState(() {
                        evasao = -1;
                        _studentController.fetchDataAllCourse(rota);
                      });
                    },
                    activeColor: Colors.white,
                  ),

                  const CustomText(
                    text: 'Geral',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: 1,
                      groupValue: evasao,
                      onChanged: (value) {
                        setState(() {
                          evasao = 1;
                          _studentController.fetchDataAllCourse(rota + '&evasao=1');
                        });
                      },
                      activeColor: Colors.white),
                  const CustomText(
                    text: 'Evadidos',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                      value: 0,
                      groupValue: evasao,
                      onChanged: (value) {
                        setState(() {
                          _studentController.fetchDataAllCourse(rota + '&evasao=0');
                          evasao = 0;
                        });
                      },
                      activeColor: Colors.white),
                  const CustomText(
                    text: 'Matriculados',
                    overflow: TextOverflow.ellipsis,
                    corText: Colors.white,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}
