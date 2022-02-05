import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:evasao_ifpb/model/chart/column_chart_model.dart';
import 'package:evasao_ifpb/page/home/components/custom_bar_column.dart';
import 'package:evasao_ifpb/page/home/components/custom_column_chart.dart';
import 'package:evasao_ifpb/page/home/components/custom_pie_chart.dart';
import 'package:evasao_ifpb/page/home/components/custom_ratio_course.dart';
import 'package:evasao_ifpb/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Card(
              elevation: 20,
              color: Colors.green,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Padding(
                  padding:
                  EdgeInsets.only(left: 10, right: 30, top: 5, bottom: 5),
                  child: CustomRadioCourse(),
                ),
              ),
            ),
          ),
          Observer(builder: (_) {
            return homeStore.loadingHomePage
                ? SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6,
              child: const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            )
                : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,
                  child: Card(
                    color: Colors.green,
                    elevation: 20,
                    child: Center(
                      child: CustomText(
                        text:
                        'Total de Alunos: ${homeStore.dataModel!.total}',
                        textAlign: TextAlign.center,
                        fontSize: 18,
                        corText: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 100,
                ),
                const CustomText(
                  text:
                  "Todos os valores dos gráficos estão em porcentagem.",
                  fontSize: 14,
                  corText: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomPieChart(
                        charTitle: 'SEXO',
                        pieData_1: homeStore.dataModel!.sexo.masculino,
                        pieData_2: homeStore.dataModel!.sexo.feminino,
                        pieLabelData_1: 'Maculino',
                        pieLabelData_2: 'Feminino',
                      ),

                      CustomColumnChart(
                        columnChart: [
                          ColumnChartModel("0-20",
                              100 * homeStore.dataModel!.cre.zero_vinte ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("20-40",
                              100 * homeStore.dataModel!.cre.vinte_quarenta ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("40-60", 100 *
                              homeStore.dataModel!.cre.quarenta_sessenta ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("60-80",
                              100 * homeStore.dataModel!.cre.sessenta_oitenta ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("80-100",
                              100 * homeStore.dataModel!.cre.oitenta_cem ~/
                                  homeStore.dataModel!.total),
                        ],
                        chartTitle: 'CRE',
                      ),

                      CustomPieChart(
                        charTitle: 'COTA',
                        pieData_1: homeStore.dataModel!.cota.sim,
                        pieData_2: homeStore.dataModel!.cota.nao,
                        pieLabelData_1: 'Sim',
                        pieLabelData_2: 'Não',
                      ),

                      CustomColumnChart(
                        columnChart: [
                          ColumnChartModel("15-22", 100 *
                              homeStore.dataModel!.idade.quinze_vintedois ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("22-28", 100 *
                              homeStore.dataModel!.idade.vintedois_vinteoito ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("28-35", 100 *
                              homeStore.dataModel!.idade
                                  .vinteoito_trintacinco ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("35-42", 100 *
                              homeStore.dataModel!.idade
                                  .trintacinco_quarentadois ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("42-50", 100 *
                              homeStore.dataModel!.idade
                                  .quarentadois_ciquenta ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("50+",
                              100 * homeStore.dataModel!.idade.ciquentaMais ~/
                                  homeStore.dataModel!.total),
                        ],
                        chartTitle: 'IDADE',
                      ),

                      CustomBarChart(
                        columnChart: [
                          ColumnChartModel("0<RFP<=1,0",
                              100 * homeStore.dataModel!.faixaRenda.zero_um ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("1,0<RFP<=2,5", 100 *
                              homeStore.dataModel!.faixaRenda.um_doiscinco ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("RFP>2,5", 100 *
                              homeStore.dataModel!.faixaRenda.maisDoisCinco ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("Não Declarado", 100 *
                              homeStore.dataModel!.faixaRenda.naoDeclarada ~/
                              homeStore.dataModel!.total),
                        ],
                        chartTitle: 'FAIXA DE RENDA',
                      ),

                      CustomColumnChart(
                        columnChart: [
                          ColumnChartModel("<=400", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .menosQuatrocentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("400-500", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .quatrocentos_quinhentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("500-600", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .quinhentos_seiscentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("600-700", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .seiscentos_setecentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("700-800", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .setecentos_oitocentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel(">=800", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .maisOitocentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("Não Informado", 100 *
                              homeStore.dataModel!.matematicaEnem
                                  .naoInformado ~/ homeStore.dataModel!.total),
                        ],
                        chartTitle: 'MÉDIA ENEM',
                      ),

                      CustomColumnChart(
                        columnChart: [
                          ColumnChartModel("<=400", 100 *
                              homeStore.dataModel!.mediaEnem
                                  .menosQuatrocentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("400-500", 100 *
                              homeStore.dataModel!.mediaEnem
                                  .quatrocentos_quinhentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("500-600", 100 *
                              homeStore.dataModel!.mediaEnem
                                  .quinhentos_seiscentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("600-700", 100 *
                              homeStore.dataModel!.mediaEnem
                                  .seiscentos_setecentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("700-800", 100 *
                              homeStore.dataModel!.mediaEnem
                                  .setecentos_oitocentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel(">=800", 100 *
                              homeStore.dataModel!.mediaEnem.maisOitocentos ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("Não Informado", 100 *
                              homeStore.dataModel!.mediaEnem.naoInformado ~/
                              homeStore.dataModel!.total),
                        ],
                        chartTitle: 'MÉDIA ENEM MATEMÁTICA',
                      ),

                      CustomPieChart(
                        charTitle: 'EVASÃO',
                        pieData_1: homeStore.dataModel!.evasao.sim,
                        pieData_2: homeStore.dataModel!.evasao.nao,
                        pieLabelData_1: 'Sim',
                        pieLabelData_2: 'Não',
                      ),

                      CustomColumnChart(
                        columnChart: [
                          ColumnChartModel(
                              "0", homeStore.dataModel!.reprovacaoNota.zero),
                          ColumnChartModel("1",
                              100 * homeStore.dataModel!.reprovacaoNota.um ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("2",
                              100 * homeStore.dataModel!.reprovacaoNota.dois ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("3",
                              100 * homeStore.dataModel!.reprovacaoNota.tres ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("4", 100 *
                              homeStore.dataModel!.reprovacaoNota.quatro ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("5",
                              100 * homeStore.dataModel!.reprovacaoNota.cinco ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("6-10", 100 *
                              homeStore.dataModel!.reprovacaoNota.seis_dez ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("11-14", 100 *
                              homeStore.dataModel!.reprovacaoNota
                                  .onze_quatorze ~/ homeStore.dataModel!.total),
                          ColumnChartModel("15-25", 100 *
                              homeStore.dataModel!.reprovacaoNota
                                  .quinze_vintecinco ~/
                              homeStore.dataModel!.total),
                        ],
                        chartTitle: 'REPROVAÇÃO POR NOTA',
                      ),

                      CustomColumnChart(
                        columnChart: [
                          ColumnChartModel("0",
                              100 * homeStore.dataModel!.reprovacaoFalta.zero ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("1",
                              100 * homeStore.dataModel!.reprovacaoFalta.um ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("2",
                              100 * homeStore.dataModel!.reprovacaoFalta.dois ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("3",
                              100 * homeStore.dataModel!.reprovacaoFalta.tres ~/
                                  homeStore.dataModel!.total),
                          ColumnChartModel("4", 100 *
                              homeStore.dataModel!.reprovacaoFalta.quatro ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("5", 100 *
                              homeStore.dataModel!.reprovacaoFalta.cinco ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("6-10", 100 *
                              homeStore.dataModel!.reprovacaoFalta.seis_dez ~/
                              homeStore.dataModel!.total),
                          ColumnChartModel("11-16", 100 *
                              homeStore.dataModel!.reprovacaoFalta.seis_dez ~/
                              homeStore.dataModel!.total),
                        ],
                        chartTitle: 'REPROVAÇÃO POR FALTA',
                      ),
                    ],
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

