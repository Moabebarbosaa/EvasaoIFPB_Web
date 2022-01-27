import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/page/metrics/components/custom_textfield.dart';
import 'package:evasao_ifpb/store/metrics_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MetricsPage extends StatelessWidget {
  MetricsPage({Key? key}) : super(key: key);

  final MetricsStore _metricsStore = GetIt.I<MetricsStore>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: CustomText(
                  text: 'INSIRA OS VALORES ADEQUADOS PARA SABER A PROBABILIDADE DE EVASÃO',
                corText: Colors.white,
                textAlign: TextAlign.center,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(labelText: 'Diferença de anos entre ensino médio e ingresso na universidade:'),
            CustomTextField(labelText: 'Média geral do ENEM:'),
            CustomTextField(labelText: 'Idade:'),
            CustomTextField(labelText: 'CRE:'),

            CustomTextField(labelText: 'Quantidades de reprovações:'),
            CustomTextField(labelText: 'Distâcia de sua casa até o IFPB:'),

            CustomTextField(labelText: 'Cor/Raça:'),
            CustomTextField(labelText: 'Cota:'),
            CustomTextField(labelText: 'Sexo:'),
            CustomTextField(labelText: 'Faixa de renda:'),

            CustomTextField(labelText: 'Tipo de residência:'),



            CustomTextField(labelText: 'Reprovou Calculo:'),
            CustomTextField(labelText: 'Reprovou as duas diciplinas principais do curso:'),


          ],
        ),
      ),
    );
  }
}
