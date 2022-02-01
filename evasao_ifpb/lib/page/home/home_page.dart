import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:evasao_ifpb/graph/build_graph.dart';
import 'package:evasao_ifpb/model/testes/histogram_model.dart';
import 'package:evasao_ifpb/page/home/components/custom_ratio_course.dart';
import 'package:evasao_ifpb/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    BuildGraph buildGraph = BuildGraph(context);
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 70),
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
                    height: MediaQuery.of(context).size.height * 0.6,
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
                        width: MediaQuery.of(context).size.width * 0.4,
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
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      CustomText(
                        text:
                            "Todos os valores dos gráficos estão em porcentagem.",
                        fontSize: MediaQuery.of(context).size.width / 120,
                        corText: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            SizedBox(
                              width: 700,
                              child: Card(
                                elevation: 20,
                                child: SfCartesianChart(
                                  title: ChartTitle(text: 'CRE'),
                                  palette: const <Color>[
                                    Colors.green,
                                  ],
                                  series: <ChartSeries>[
                                    HistogramSeries<Cre, double>(
                                        dataSource: homeStore.histograma_cre!.histogram,
                                        showNormalDistributionCurve: true,
                                        curveColor: Colors.red,
                                        binInterval: 20,
                                        yValueMapper: (Cre sales, _) => sales.cre

                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 700,
                              child: Card(
                                elevation: 20,
                                child: SfCircularChart(
                                    title: ChartTitle(text: 'SEXO'),
                                    series: <CircularSeries>[
                                      PieSeries<ChartData, String>(
                                          dataSource: [
                                            ChartData(homeStore.dataModel!.sexo.masculino, 'Maculino', Colors.green.shade900),
                                            ChartData(homeStore.dataModel!.sexo.feminino, 'Feminino', Colors.green),
                                          ],
                                          pointColorMapper:(ChartData data,  _) => data.color,
                                          xValueMapper: (ChartData data, _) => data.nome,
                                          yValueMapper: (ChartData data, _) => data.qtd,
                                          // Segments will explode on tap
                                          explode: true,
                                          // First segment will be exploded on initial rendering
                                          explodeIndex: 1
                                      )
                                    ]
                                ),
                              ),
                            ),


                            // buildGraph.buildContainerPizza("Sexo", [
                            //   homeStore.dataModel!.sexo.masculino,
                            //   homeStore.dataModel!.sexo.feminino
                            // ], [
                            //   "Masculino",
                            //   "Feminino"
                            // ]),
                            buildGraph.buildContainerBarVertical("Idade", [
                              homeStore.dataModel!.idade.quinze_vintedois,
                              homeStore.dataModel!.idade.vintedois_vinteoito,
                              homeStore.dataModel!.idade.vinteoito_trintacinco,
                              homeStore
                                  .dataModel!.idade.trintacinco_quarentadois,
                              homeStore.dataModel!.idade.quarentadois_ciquenta,
                              homeStore.dataModel!.idade.ciquentaMais
                            ], [
                              "15-22",
                              "22-28",
                              "28-35",
                              "35-42",
                              "42-50",
                              "50+"
                            ]),
                            buildGraph.buildContainerPizza("Cota", [
                              homeStore.dataModel!.cota.sim,
                              homeStore.dataModel!.cota.nao
                            ], [
                              "Sim",
                              "Não"
                            ]),
                            buildGraph
                                .buildContainerBarHorizontal("Faixa de Renda", [
                              homeStore.dataModel!.faixaRenda.zero_um,
                              homeStore.dataModel!.faixaRenda.um_doiscinco,
                              homeStore.dataModel!.faixaRenda.maisDoisCinco,
                              homeStore.dataModel!.faixaRenda.naoDeclarada
                            ], [
                              "0<RFP<=1,0",
                              "1,0<RFP<=2,5",
                              "RFP>2,5",
                              "Não Declarado"
                            ]),
                            buildGraph.buildContainerBarHorizontal("CRE", [
                              homeStore.dataModel!.cre.zero_vinte,
                              homeStore.dataModel!.cre.vinte_quarenta,
                              homeStore.dataModel!.cre.quarenta_sessenta,
                              homeStore.dataModel!.cre.sessenta_oitenta,
                              homeStore.dataModel!.cre.oitenta_cem
                            ], [
                              "0-20",
                              "20-40",
                              "40-60",
                              "60-80",
                              "80-100"
                            ]),
                            buildGraph
                                .buildContainerBarHorizontal("Média ENEM", [
                              homeStore.dataModel!.mediaEnem.menosQuatrocentos,
                              homeStore
                                  .dataModel!.mediaEnem.quatrocentos_quinhentos,
                              homeStore
                                  .dataModel!.mediaEnem.quinhentos_seiscentos,
                              homeStore
                                  .dataModel!.mediaEnem.seiscentos_setecentos,
                              homeStore
                                  .dataModel!.mediaEnem.setecentos_oitocentos,
                              homeStore.dataModel!.mediaEnem.maisOitocentos,
                              homeStore.dataModel!.mediaEnem.naoInformado
                            ], [
                              "<=400",
                              "400-500",
                              "500-600",
                              "600-700",
                              "700-800",
                              ">=800",
                              "Não Informado"
                            ]),
                            buildGraph.buildContainerBarHorizontal(
                                "Nota ENEM Matemática", [
                              homeStore
                                  .dataModel!.matematicaEnem.menosQuatrocentos,
                              homeStore.dataModel!.matematicaEnem
                                  .quatrocentos_quinhentos,
                              homeStore.dataModel!.matematicaEnem
                                  .quinhentos_seiscentos,
                              homeStore.dataModel!.matematicaEnem
                                  .seiscentos_setecentos,
                              homeStore.dataModel!.matematicaEnem
                                  .setecentos_oitocentos,
                              homeStore
                                  .dataModel!.matematicaEnem.maisOitocentos,
                              homeStore.dataModel!.matematicaEnem.naoInformado
                            ], [
                              "<=400",
                              "400-500",
                              "500-600",
                              "600-700",
                              "700-800",
                              ">=800"
                            ]),
                            buildGraph.buildContainerPizza("Evasão", [
                              homeStore.dataModel!.evasao.sim,
                              homeStore.dataModel!.evasao.nao
                            ], [
                              "Sim",
                              "Não"
                            ]),
                            buildGraph.buildContainerBarHorizontal(
                                "Reprovação por Nota", [
                              homeStore.dataModel!.reprovacaoNota.zero,
                              homeStore.dataModel!.reprovacaoNota.um,
                              homeStore.dataModel!.reprovacaoNota.dois,
                              homeStore.dataModel!.reprovacaoNota.tres,
                              homeStore.dataModel!.reprovacaoNota.quatro,
                              homeStore.dataModel!.reprovacaoNota.cinco,
                              homeStore.dataModel!.reprovacaoNota.seis_dez,
                              homeStore.dataModel!.reprovacaoNota.onze_quatorze,
                              homeStore
                                  .dataModel!.reprovacaoNota.quinze_vintecinco
                            ], [
                              "0",
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6-10",
                              "11-14",
                              "15-25"
                            ]),
                            buildGraph.buildContainerBarHorizontal(
                                "Reprovação por Falta", [
                              homeStore.dataModel!.reprovacaoFalta.zero,
                              homeStore.dataModel!.reprovacaoFalta.um,
                              homeStore.dataModel!.reprovacaoFalta.dois,
                              homeStore.dataModel!.reprovacaoFalta.tres,
                              homeStore.dataModel!.reprovacaoFalta.quatro,
                              homeStore.dataModel!.reprovacaoFalta.cinco,
                              homeStore.dataModel!.reprovacaoFalta.seis_dez,
                              homeStore
                                  .dataModel!.reprovacaoFalta.onze_dezesseis
                            ], [
                              "0",
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6-10",
                              "11-16"
                            ]),
                          ],
                        ),
                      )
                    ],
                  );
          })
        ],
      ),
    ));
  }
}

class ChartData {
  ChartData(this.qtd, this.nome, [this.color]);
  final int qtd;
  final String nome;
  final Color? color;
}
