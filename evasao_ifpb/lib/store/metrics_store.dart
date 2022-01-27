import 'package:evasao_ifpb/model/metrics_model.dart';
import 'package:evasao_ifpb/repository/metrics_repository.dart';
import 'package:mobx/mobx.dart';

part 'metrics_store.g.dart';

class MetricsStore = _MetricsStore with _$MetricsStore;

abstract class _MetricsStore with Store {

  _MetricsStore() {
    autorun((_) async {
      await loadScreen();
    });
  }

  @observable
  MetricsModel? metricsModel;

  @observable
  bool loadingStudentPage = true;

  @action
  Future<void> fetchProbability() async {
    try {
      loadingStudentPage = true;
      final result = await MetricsRepository().fetchProbability();
      metricsModel = result;
      loadingStudentPage = false;
    } catch (e) {
      loadingStudentPage = true;
      print(e);
    }
  }

  Future<void> loadScreen() async {
    loadingStudentPage = true;
    await fetchProbability();
    loadingStudentPage = false;
  }

}
