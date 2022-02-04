import 'package:evasao_ifpb/model/metrics_model.dart';
import 'package:evasao_ifpb/repository/metrics_repository.dart';
import 'package:mobx/mobx.dart';

part 'metrics_store.g.dart';

class MetricsStore = _MetricsStore with _$MetricsStore;

abstract class _MetricsStore with Store {
  @observable
  String cre = '';

  @action
  void setCre(String value) => cre = value;

  @observable
  String reprovacao = '';

  @action
  void setReprovacao(String value) => reprovacao = value;

  @observable
  String distacia = '';

  @action
  void setDistacia(String value) => distacia = value;

  @observable
  String indice_ch = '';

  @action
  void setIndice_ch(String value) => indice_ch = value;

  @observable
  String m_enem = '';

  @action
  void setM_enem(String value) => m_enem = value;

  @observable
  String ch_enem = '';

  @action
  void setCh_enem(String value) => ch_enem = value;

  @observable
  String dif_ensMedio = '';

  @action
  void setDif_ensMedio(String value) => dif_ensMedio = value;

  @observable
  String idade = '';

  @action
  void setIdade(String value) => idade = value;

  @computed
  bool get isRequestValid {
    if ((cre.isEmpty) ||
        (reprovacao.isEmpty) ||
        (distacia.isEmpty) ||
        (indice_ch.isEmpty) ||
        (m_enem.isEmpty) ||
        (ch_enem.isEmpty) ||
        (dif_ensMedio.isEmpty) ||
        (idade.isEmpty)) {
      return false;
    }
    return true;
  }

  @observable
  String metricsModel = '';

  @observable
  bool loadingStudentPage = false;

  @action
  Future<void> fetchProbability() async {
    try {
      loadingStudentPage = true;
      await Future.delayed(const Duration(seconds: 2));
      final result = await MetricsRepository().fetchProbability('/' +
          cre +
          '/' +
          reprovacao +
          '/' +
          distacia +
          '/' +
          indice_ch +
          '/' +
          m_enem +
          '/' +
          ch_enem +
          '/' +
          dif_ensMedio +
          '/' +
          idade);
      metricsModel = 'Você tem ' + double.parse(result.probability).toStringAsFixed(2) + '%' + ' de chance de evadir!';
      loadingStudentPage = false;
    } catch (e) {
      loadingStudentPage = true;
      print(e);
    }
  }
}
