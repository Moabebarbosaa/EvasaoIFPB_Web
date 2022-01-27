import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:evasao_ifpb/graph/pie_chart.dart';
import 'package:flutter/material.dart';

import 'bar_horizontal.dart';
import 'bar_vertical.dart';

class BuildGraph{

  BuildContext context;

  BuildGraph(this.context);


  Container buildContainerIni(String nome, int valor){
    return Container(
      width: MediaQuery.of(context).size.width/10,
      height: MediaQuery.of(context).size.height/10,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: nome,fontSize: MediaQuery.of(context).size.width/100, fontWeight: FontWeight.bold,),
            CustomText(text: valor.toString(),fontSize: MediaQuery.of(context).size.width/80),
          ],
        ),
      ),
    );
  }

  Container buildContainerPizza(String nome,List<int> valores,List<String> variaveis){
    return Container(
      width: MediaQuery.of(context).size.width/3.5,
      height: MediaQuery.of(context).size.height/2.5,
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB( MediaQuery.of(context).size.width/20, 20, 0,  MediaQuery.of(context).size.width/20),
              child: CustomText(text: nome,fontSize: MediaQuery.of(context).size.width/80, fontWeight: FontWeight.bold,),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/15, 0, MediaQuery.of(context).size.width/55,  0),
              child: PieChartSample2(nome,valores,variaveis),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerBarHorizontal(String nome,List<int> valores,List<String> variaveis){
    return Container(
      width: MediaQuery.of(context).size.width/3.5,
      height: MediaQuery.of(context).size.height/2.5,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: nome,fontSize: MediaQuery.of(context).size.width/80, fontWeight: FontWeight.bold,),
            Container(
              width: MediaQuery.of(context).size.width/5,
              height: MediaQuery.of(context).size.height/3.5,
              child: BarHorizontal.create(valores,variaveis),
            )
          ],
        ),
      )
    );
  }

  Container buildContainerBarVertical(String nome,List<int> valores,List<String> variaveis){
    return Container(
      width: MediaQuery.of(context).size.width/3.5,
      height: MediaQuery.of(context).size.height/2.5,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: nome,fontSize: MediaQuery.of(context).size.width/80, fontWeight: FontWeight.bold,),
            Container(
              width: MediaQuery.of(context).size.width/5,
              height: MediaQuery.of(context).size.height/3.5,
              child: BarVertical.create(valores,variaveis),
            )
          ],
        ),
      )
    );
  }

}