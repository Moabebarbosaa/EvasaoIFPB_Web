import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/page/metrics/components/custom_textfield.dart';
import 'package:evasao_ifpb/store/metrics_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class MetricsPage extends StatelessWidget {
  MetricsPage({Key? key}) : super(key: key);

  final MetricsStore _metricsStore = MetricsStore();

  final TextEditingController cre = TextEditingController();
  final TextEditingController reprovacao = TextEditingController();
  final TextEditingController distacia = TextEditingController();
  final TextEditingController indice_ch = TextEditingController();
  final TextEditingController m_enem = TextEditingController();
  final TextEditingController ch_enem = TextEditingController();
  final TextEditingController dif_ensMedio = TextEditingController();
  final TextEditingController idade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Observer(builder: (_){
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: CustomText(
                  text: 'INSIRA OS VALORES ADEQUADOS PARA SABER A PROBABILIDADE DE EVASÃO',
                  corText: Colors.white,
                  textAlign: TextAlign.center,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),

              CustomTextField(labelText: 'CRE:', textEditingController: cre, onChanged: _metricsStore.setCre),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Reprovação por falta:', textEditingController: reprovacao, onChanged: _metricsStore.setReprovacao),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Distâcia de sua casa até o IFPB:', textEditingController: distacia, onChanged: _metricsStore.setDistacia),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Índice CH:', textEditingController: indice_ch, onChanged: _metricsStore.setIndice_ch),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Nota de Matemática do ENEM:', textEditingController: m_enem, onChanged: _metricsStore.setM_enem),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Nota de Ciências da Natureza do ENEM:', textEditingController: ch_enem, onChanged: _metricsStore.setCh_enem),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Diferença entre anos do Ens. Médio e ingresso na Universidade:', textEditingController: dif_ensMedio, onChanged: _metricsStore.setDif_ensMedio),
              const SizedBox(height: 20),
              CustomTextField(labelText: 'Idade:', textEditingController: idade, onChanged: _metricsStore.setIdade),
              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child:TextButton(
                          onPressed: () {
                            if (_metricsStore.isRequestValid) {
                              _metricsStore.fetchProbability();
                            } else {
                              _metricsStore.metricsModel = 'Insira valores em todos os campos!';
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green.shade900,
                            onSurface: Colors.green,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'DESCOBRIR PROBABILIDADE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  _metricsStore.loadingStudentPage
                      ? const Expanded(child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)))
                      : Expanded(
                      child: Text(
                        _metricsStore.metricsModel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
