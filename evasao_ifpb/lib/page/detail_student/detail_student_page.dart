import 'package:evasao_ifpb/page/base/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../components/custom_text.dart';
import '../../store/student_store.dart';
import 'generate_rows.dart';

class DetailStudentPage extends StatelessWidget {

  DetailStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentStore _studentController = GetIt.I<StudentStore>();
    final student = _studentController.studentModel;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 950,
                  child: Wrap(
                    children: [
                      Card(
                        elevation: 50,
                        child: Column(
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
                                  student!.matricula!.toString().replaceRange(8, 11, "***"),
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
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              children: [
                                SfCartesianChart(
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
                                SfCartesianChart(
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
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              )
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.periodo, this.risco_cre);

  final String periodo;
  final double risco_cre;
}
