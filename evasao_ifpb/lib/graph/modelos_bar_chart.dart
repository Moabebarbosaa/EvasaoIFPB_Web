import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ModelosBarChart extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ModelosBarChartState();
}

class _ModelosBarChartState extends State<ModelosBarChart> {
  String arvore="123",floresta="456",regressao="789",xgb="10";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3.5,
      child: Padding(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/30, left: MediaQuery.of(context).size.width/45, top: MediaQuery.of(context).size.height/20, bottom: MediaQuery.of(context).size.height/20),
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.width/1000,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: BarChart(
                BarChartData(
                  maxY: 101,
                  groupsSpace: MediaQuery.of(context).size.width/30,
                  alignment: BarChartAlignment.center,
                  barTouchData: BarTouchData(
                    enabled: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      margin: 10,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Árvore';
                          case 1:
                            return 'Floresta';
                          case 2:
                            return 'Regressão';
                          case 3:
                            return 'XGB';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      margin: MediaQuery.of(context).size.width/150,
                    ),
                  ),
                  gridData: FlGridData(
                    horizontalInterval: 10,
                    show: true,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: const Color(0xffe7e8ec),
                      strokeWidth: 2,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: getData(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double porcentagem(String n){
    if(n=="1.00") return 100;
    String n_str = "";
    int cont_esp = 0;
    for(int i=0;i<n.length;i++){
      if(cont_esp==1) n_str+=n[i];
      if(n[i]==".") cont_esp++;
    }
    if(n_str[0]=="0") return 1;
    return double.parse(n_str);
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
              width: MediaQuery.of(context).size.width/70,
              y: porcentagem(arvore),
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
              width: MediaQuery.of(context).size.width/70,
              y: porcentagem(floresta),
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
              width: MediaQuery.of(context).size.width/70,
              y: porcentagem(regressao),
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
              width: MediaQuery.of(context).size.width/70,
              y: porcentagem(xgb),
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}