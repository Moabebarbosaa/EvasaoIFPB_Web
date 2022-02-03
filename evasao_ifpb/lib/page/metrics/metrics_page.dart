import 'package:evasao_ifpb/Components/custom_text.dart';
import 'package:evasao_ifpb/page/metrics/components/custom_textfield.dart';
import 'package:evasao_ifpb/store/metrics_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MetricsPage extends StatelessWidget {
  MetricsPage({Key? key}) : super(key: key);

  final MetricsStore _metricsStore = GetIt.I<MetricsStore>();

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
    final size = MediaQuery.of(context).size;
    return Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
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

            

                CustomTextField(labelText: 'CRE:', textEditingController: cre,),
                CustomTextField(labelText: 'Reprovação por falta:', textEditingController: reprovacao,),
                CustomTextField(labelText: 'Distâcia de sua casa até o IFPB:', textEditingController: distacia,),
                CustomTextField(labelText: 'Índice CH:', textEditingController: indice_ch,),
                CustomTextField(labelText: 'Nota de Matemática do ENEM:', textEditingController: m_enem,),
                CustomTextField(labelText: 'Nota de Ciências da Natureza do ENEM:', textEditingController: ch_enem,),
                CustomTextField(labelText: 'Diferença entre anos do Ens. Médio e ingresso na Universidade:', textEditingController: dif_ensMedio,),
                CustomTextField(labelText: 'Idade:', textEditingController: idade,),

                const SizedBox(height: 30,),

                SizedBox(
                  height: 40,
                  width: size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child:TextButton(
                      onPressed: (){

                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                        onSurface: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(width: 20,),
                          Expanded(
                            child: Text(
                              'DESCOBRIR PROBABILIDADE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
