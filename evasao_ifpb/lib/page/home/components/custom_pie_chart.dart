import 'package:evasao_ifpb/model/chart/pie_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPieChart extends StatelessWidget {

  final String charTitle;
  final double pieData_1;
  final double pieData_2;
  final String pieLabelData_1;
  final String pieLabelData_2;

  const CustomPieChart({
    Key? key,
    required this.charTitle,
    required this.pieData_1,
    required this.pieData_2,
    required this.pieLabelData_1,
    required this.pieLabelData_2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: Card(
        elevation: 20,
        child: SfCircularChart(
            title: ChartTitle(text: charTitle),
            legend: Legend(
                isVisible: true,
                iconWidth: 20,
                iconHeight: 20,
                position: LegendPosition.right,
                textStyle: const TextStyle(
                    fontSize: 17
                )
            ),
            series: <CircularSeries>[
              PieSeries<PieChartModel, String>(
                  dataSource: [
                    PieChartModel(pieData_1, pieLabelData_1, Colors.green.shade900),
                    PieChartModel(pieData_2, pieLabelData_2, Colors.green),
                  ],
                  pointColorMapper:(PieChartModel data,  _) => data.color,
                  xValueMapper: (PieChartModel data, _) => data.nome,
                  yValueMapper: (PieChartModel data, _) => data.qtd,
                  dataLabelSettings: const DataLabelSettings(
                      useSeriesColor: true,
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      labelIntersectAction: LabelIntersectAction.shift,
                      connectorLineSettings: ConnectorLineSettings(
                          type: ConnectorType.curve
                      )
                  ),
                  explode: true,
                  explodeIndex: 1
              )
            ]
        ),
      ),
    );
  }
}

