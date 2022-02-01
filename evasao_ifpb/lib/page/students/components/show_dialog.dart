import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/graph/build_graph.dart';
import 'package:evasao_ifpb/graph/evolucao.dart';
import 'package:evasao_ifpb/graph/modelos_bar_chart.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'custom_dialog.dart';
import 'generate_rows.dart';

ScaleTransition bodyShowDialog(Animation<double> a1, BuildGraph buildGraph) {
  final StudentStore _studentController = GetIt.I<StudentStore>();
  final student = _studentController.studentModel;

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
                  columns: <DataColumn>[
                    for (int i = 0; i < 6; i++) ...[
                      const DataColumn(label: Text(''))
                    ]
                  ],
                  rows: <DataRow>[
                    generateRows([
                      'Matrícula:',
                      'Curso:',
                      'Período atual:'
                    ], [
                      student!.matricula!,
                      student.curso!,
                      student.periodo_atual!
                    ]),
                    generateRows([
                      'Ano de Ingresso:',
                      'Sit. ultimo período:',
                      'CRE:'
                    ], [
                      student.ano_ingresso!,
                      student.sit_ultimo_periodo!,
                      student.historic![0].cre
                    ]),
                    generateRows(['Idade:', 'Faixa de renda:', 'Cota:'],
                        [student.idade!, student.faixa_renda!, student.cota!]),
                    generateRows([
                      'Reprovação por nota:',
                      'Reprovação por falta:',
                      'Cidade:'
                    ], [
                      student.historic![0].reprovacao_nota,
                      student.historic![0].reprovacao_falta,
                      student.cidade!
                    ]),
                    generateRows([
                      'Média do enem:',
                      'Nota ENEM Matemática:',
                      'Nota ENEM Redação:'
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
                          title: ChartTitle(text: 'Histórico de CRE'),
                          primaryXAxis: CategoryAxis(),
                          palette: const <Color>[
                            Colors.green,
                            Colors.orange,
                            Colors.brown
                          ],
                          series: <ChartSeries>[
                            // Renders line chart
                            LineSeries<ChartData, String>(
                                dataSource: [
                                  ChartData(student.historic![1].periodo,
                                      student.historic![1].cre),
                                  ChartData(student.historic![2].periodo,
                                      student.historic![2].cre),
                                ],
                                xValueMapper: (ChartData sales, _) =>
                                    sales.periodo,
                                yValueMapper: (ChartData sales, _) =>
                                    sales.risco_cre),
                          ]),
                    ),
                    Expanded(
                      child: SfCartesianChart(
                          title: ChartTitle(text: 'Histórico de Risco de Evasão'),
                          primaryXAxis: CategoryAxis(),
                          palette: const <Color>[
                            Colors.green,
                          ],
                          series: <ChartSeries>[
                            // Renders line chart
                            LineSeries<ChartData, String>(
                                dataSource: [
                                  ChartData(student.historic![1].periodo,
                                      student.historic![1].risco),
                                  ChartData(student.historic![2].periodo,
                                      student.historic![2].risco),
                                ],
                                xValueMapper: (ChartData sales, _) =>
                                    sales.periodo,
                                yValueMapper: (ChartData sales, _) =>
                                    sales.risco_cre)
                          ]),
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
  ChartData(this.periodo, this.risco_cre);

  final String periodo;
  final double risco_cre;
}
