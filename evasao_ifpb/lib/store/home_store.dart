import 'package:evasao_ifpb/model/data/cre.dart';
import 'package:evasao_ifpb/model/data_model.dart';
import 'package:evasao_ifpb/repository/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  _HomeStore() {
    autorun((_) async {
      await loadScreen();
    });
  }

  @observable
  DataModel? dataModel;

  @observable
  bool loadingHomePage = true;

  @action
  Future<void> fetchDataAllCourse(String filter) async {
    try {
      loadingHomePage = true;
      final result = await HomeRepository().fetchDataAllCourse(filter);
      dataModel = result;
      loadingHomePage = false;
    } catch (e) {
      loadingHomePage = true;
      print(e);
    }
  }

  Future<void> loadScreen() async {
    loadingHomePage = true;
    await fetchDataAllCourse('/'); //?curso=computacao
    loadingHomePage = false;
  }
}
