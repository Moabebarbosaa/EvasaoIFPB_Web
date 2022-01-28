import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../components/indicator.dart';

class PieChartSample2 extends StatefulWidget {
  List<String> variaveis;
  String nome;
  List<int> valores;

  PieChartSample2(this.nome, this.valores, this.variaveis);

  @override
  State<StatefulWidget> createState() => PieChart2State(
        nome == "Evasão" || nome == "Reprovou dois"
            ? [0xff008000, 0xffFF3B1F]
            : [0xff008000, 0xff1B98E0],
        valores,
        variaveis,
      );
}

class PieChart2State extends State {
  List<int> coresAzul = [0xff008000, 0xff1B98E0];
  List<int> coresVermelho = [0xff008000, 0xffFF3B1F];
  List<int> cores;
  List<String> variaveis;
  List<int> valores;

  PieChart2State(this.cores, this.valores, this.variaveis);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: MediaQuery.of(context).size.height / 25,
                  sections: showingSections()),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(variaveis.length, (index) {
            return Column(
              children: [
                Indicator(
                  color: index == 0 ? Colors.green : Colors.green.shade900,
                  text: variaveis[index],
                  isSquare: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 250,
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    int total = 0;

    for (int i = 0; i < variaveis.length; i++) {
      try {
        total += valores[i];
      } catch (e) {
        total += 10;
      }
    }

    double porcentagem(int num) {
      return (100 * num) / total;
    }

    return List.generate(variaveis.length, (i) {
      final double fontSize = MediaQuery.of(context).size.width / 80;
      final double radius = MediaQuery.of(context).size.width / 25;
      try {
        return PieChartSectionData(
          color: i == 0 ? Colors.green : Colors.green.shade900,
          value: porcentagem(valores[i]),
          title: porcentagem(valores[i]).toStringAsPrecision(3) + "%",
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      } catch (e) {
        return PieChartSectionData(
          color: i == 0 ? Colors.green : Colors.green.shade900,
          value: double.parse(i.toString()),
          title: i.toString(),
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      }
    });
  }
}