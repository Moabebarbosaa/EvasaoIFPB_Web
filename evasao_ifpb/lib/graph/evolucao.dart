import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LineChartSample extends StatefulWidget {
  LineChartSample();

  @override
  _LineChartSampleState createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {

  String texto_grafico = "";
  double mX = 1;
  List<FlSpot> dados = [FlSpot(0, 0),FlSpot(1, 0)];
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/150, MediaQuery.of(context).size.width/100, 0, MediaQuery.of(context).size.width/100),
              child: Stack(
                children: [
                  Center(
                    child: Text(texto_grafico),
                  ),
                  Center(
                    child: LineChart(
                      mainData(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitles: (value) {
            try{
              return "10";
            }catch(e){
              return "";
            }

          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
              case 50:
                return '50';
              case 60:
                return '60';
              case 70:
                return '70';
              case 80:
                return '80';
              case 90:
                return '90';
              case 100:
                return '100';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: mX-1,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: dados,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

}