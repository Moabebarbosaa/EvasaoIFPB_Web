import 'package:flutter/material.dart';

import '../../../graph/evolucao.dart';
import '../../../graph/modelos_bar_chart.dart';
import 'custom_dialog.dart';
import 'generate_rows.dart';

ScaleTransition bodyShowDialog(Animation<double> a1){
  return ScaleTransition(
    scale: CurvedAnimation(
        parent: a1,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeOutCubic),
    child: CustomDialog( // our custom dialog
      content: Column(
        children: [
          DataTable(
            columnSpacing: 15,
            columns: const <DataColumn>[
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
            ],
            rows: <DataRow>[

              generateRows(['Matrícula:','Curso:','Período atual:'],
                  ['201921220004','Contrução de Edifícios','1']),

              generateRows(['Ano de Ingresso:','Sit. ultimo período:','CRE:'],
                  ['2019','Cancelou','0.0']),

              generateRows(['Ano de Ingresso:','Sit. ultimo período:','CRE:'],
                  ['2019','Cancelou','0.0']),

              generateRows(['Idade:','Faixa de renda:','Cota:'],
                  ['19','Não declarado','0']),

              generateRows(['Reprovação por nota:','Reprovação por falta:','Reprovou Dois:'],
                  ['0','0','Não']),

              generateRows(['Média do enem:','Nota enem Mat.:','Nota enem Red.:'],
                  ['595.76','691.90','660.00']),
            ],
          ),
          Divider(),
          // Container(
          //   child: Row(
          //     children: [
          //       Expanded(child: LineChartSample()),
          //       Expanded(child: ModelosBarChart())
          //     ],
          //   ),
          // )
        ],
      ),
      negativeBtnText: "Fechar",
    ),
  );
}