// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MetricsStore on _MetricsStore, Store {
  final _$metricsModelAtom = Atom(name: '_MetricsStore.metricsModel');

  @override
  MetricsModel? get metricsModel {
    _$metricsModelAtom.reportRead();
    return super.metricsModel;
  }

  @override
  set metricsModel(MetricsModel? value) {
    _$metricsModelAtom.reportWrite(value, super.metricsModel, () {
      super.metricsModel = value;
    });
  }

  final _$loadingStudentPageAtom =
      Atom(name: '_MetricsStore.loadingStudentPage');

  @override
  bool get loadingStudentPage {
    _$loadingStudentPageAtom.reportRead();
    return super.loadingStudentPage;
  }

  @override
  set loadingStudentPage(bool value) {
    _$loadingStudentPageAtom.reportWrite(value, super.loadingStudentPage, () {
      super.loadingStudentPage = value;
    });
  }

  final _$fetchProbabilityAsyncAction =
      AsyncAction('_MetricsStore.fetchProbability');

  @override
  Future<void> fetchProbability() {
    return _$fetchProbabilityAsyncAction.run(() => super.fetchProbability());
  }

  @override
  String toString() {
    return '''
metricsModel: ${metricsModel},
loadingStudentPage: ${loadingStudentPage}
    ''';
  }
}
