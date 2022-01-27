import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:evasao_ifpb/graph/build_graph.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    BuildGraph buildGraph = new BuildGraph(context);

    return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:  MediaQuery.of(context).size.height/70,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildGraph.buildContainerIni("Nº de Alunos", 1),
                      buildGraph.buildContainerIni("Alto risco de evasão", 2),
                      buildGraph.buildContainerIni("Formandos", 3),
                      buildGraph.buildContainerIni("Acurácia", 4)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/100,),
                  CustomText(text: "Todos os valores dos gráficos estão em porcentagem.",fontSize: MediaQuery.of(context).size.width/120,corText: Colors.white,),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildGraph.buildContainerPizza("Sexo",[10,20],["Feminino","Masculino"]),
                            buildGraph.buildContainerBarVertical("Idade", [1,2,3,4,5,6], ["15-21","22-28","29-35","36-42","43-49","50+"]),
                            buildGraph.buildContainerPizza("Sexo",[10,20],["Feminino","Masculino"]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildGraph.buildContainerBarHorizontal("Faixa de Renda", [1,2,3,4,5,6,7], ["nao_declarado","0<renda<=0,5","0,5<renda<=1","1,0<renda<=1,5","1,5<renda<=2,5","2,5<renda<=3,5","renda>3,5"]),
                            buildGraph.buildContainerPizza("Tipo de Escola",[1,2],["Particular","Publica"]),
                            buildGraph.buildContainerBarHorizontal("CRE", [1,2,3,4,5,6,7,8,9,10], ["0-10","11-20","21-30","31-40","41-50","51-60","61-70","71-80","81-90","91-100"]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildGraph.buildContainerPizza("Evasão",[1,2],["Não","Sim"]),
                            buildGraph.buildContainerBarHorizontal("Média ENEM", [1,2,3,4,5,6], ["<=400","400-500","500-600","600-700","700-800",">=800"]),
                            buildGraph.buildContainerBarHorizontal("Média ENEM (Mat.)", [1,2,3,4,5,6], ["<=400","400-500","500-600","600-700","700-800",">=800"]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildGraph.buildContainerPizza("Reprovou dois",[1,2],["Não","Sim"]),
                            buildGraph.buildContainerBarHorizontal("Reprovação Nota", [1,2,3,4,5,6,7,8,9], ["0","1","2","3","4","5","6-10","11-14","16-18"]),
                            buildGraph.buildContainerBarHorizontal("Reprovação Falta", [1,2,3,4,5,6,7,8], ["0","1","2","3","4","5","6-10","11-16"]),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

}


