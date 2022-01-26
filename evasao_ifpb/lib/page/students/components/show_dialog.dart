import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/graph/evolucao.dart';
import 'package:evasao_ifpb/graph/modelos_bar_chart.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'custom_dialog.dart';
import 'generate_rows.dart';

ScaleTransition bodyShowDialog(Animation<double> a1) {
  final StudentStore _studentController = GetIt.I<StudentStore>();
  final student = _studentController.studentModel;

  final List<ChartData> chartData = [
    ChartData(2010, 35),
    ChartData(2011, 28),
    ChartData(2012, 34),
    ChartData(2013, 32),
    ChartData(2014, 40)
  ];

  return ScaleTransition(
    scale: CurvedAnimation(
        parent: a1,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeOutCubic),
    child: _studentController.loadingStudentPage
        ? Container()
        : CustomDialog(
            content: Column(
              children: [
                DataTable(
                  columnSpacing: 15,
                  columns:  <DataColumn>[
                    for(int i = 0; i < 6; i++) ... [const DataColumn(label: Text(''))]
                  ],
                  rows: <DataRow>[
                    generateRows(['Matrícula:', 'Curso:', 'Período atual:'],
                        [student!.matricula, student.curso, student.periodo_atual!]),
                    generateRows([
                      'Ano de Ingresso:',
                      'Sit. ultimo período:',
                      'CRE:'
                    ], [
                      student.ano_ingresso!,
                      student.sit_ultimo_periodo!,
                      student.cre
                    ]),
                    generateRows(['Idade:', 'Faixa de renda:', 'Cota:'],
                        [student.idade, student.faixa_renda!, student.cota!]),
                    generateRows([
                      'Reprovação por nota:',
                      'Reprovação por falta:',
                      'Cidade:'
                    ], [
                      student.reprovacao_nota!,
                      student.reprovacao_falta!,
                      student.cidade!
                    ]),
                    generateRows([
                      'Média do enem:',
                      'Nota ENEM Matemática:',
                      'Nota enem Red.:'
                    ], [
                      student.nu_media!,
                      student.nu_nota_m!,
                      student.nu_nota_r!
                    ]),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SfCartesianChart(
                          series: <ChartSeries>[
                            // Renders line chart
                            LineSeries<ChartData, int>(
                                dataSource: chartData,
                                xValueMapper: (ChartData sales, _) => sales.year,
                                yValueMapper: (ChartData sales, _) => sales.sales
                            )
                          ]
                      ),
                    ),
                    Expanded(
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          // Renders line chart
                          LineSeries<ChartData, int>(
                              dataSource: chartData,
                              xValueMapper: (ChartData sales, _) => sales.year,
                              yValueMapper: (ChartData sales, _) => sales.sales
                          )
                        ]
                      ),
                    ),
                  ],
                )
              ],
            ),
            negativeBtnText: "Fechar",
          ),
  );
}

class ChartData {
  ChartData(this.year, this.sales);
  final int year;
  final double sales;
}
