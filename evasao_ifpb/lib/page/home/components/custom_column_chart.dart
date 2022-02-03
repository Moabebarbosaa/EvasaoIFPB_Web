import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:evasao_ifpb/model/chart/column_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomColumnChart extends StatelessWidget {
  final List<ColumnChartModel> columnChart;
  final String chartTitle;

  const CustomColumnChart({
    Key? key,
    required this.columnChart,
    required this.chartTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: Card(
        elevation: 20,
        child: SfCartesianChart(
          title: ChartTitle(text: chartTitle),
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              ColumnSeries<ColumnChartModel, String>(
                dataSource: columnChart,
                color: Colors.green,
                xValueMapper: (ColumnChartModel sales, _) => sales.nome,
                yValueMapper: (ColumnChartModel sales, _) => sales.qtd,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  useSeriesColor: true,
                ),
              )
            ]),
      ),
    );
  }
}
