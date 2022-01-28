// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$dataModelAtom = Atom(name: '_HomeStore.dataModel');

  @override
  DataModel? get dataModel {
    _$dataModelAtom.reportRead();
    return super.dataModel;
  }

  @override
  set dataModel(DataModel? value) {
    _$dataModelAtom.reportWrite(value, super.dataModel, () {
      super.dataModel = value;
    });
  }

  final _$loadingHomePageAtom = Atom(name: '_HomeStore.loadingHomePage');

  @override
  bool get loadingHomePage {
    _$loadingHomePageAtom.reportRead();
    return super.loadingHomePage;
  }

  @override
  set loadingHomePage(bool value) {
    _$loadingHomePageAtom.reportWrite(value, super.loadingHomePage, () {
      super.loadingHomePage = value;
    });
  }

  final _$fetchDataAllCourseAsyncAction =
      AsyncAction('_HomeStore.fetchDataAllCourse');

  @override
  Future<void> fetchDataAllCourse(String filter) {
    return _$fetchDataAllCourseAsyncAction
        .run(() => super.fetchDataAllCourse(filter));
  }

  @override
  String toString() {
    return '''
dataModel: ${dataModel},
loadingHomePage: ${loadingHomePage}
    ''';
  }
}
