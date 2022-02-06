// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentStore on _StudentStore, Store {
  final _$studentModelAtom = Atom(name: '_StudentStore.studentModel');

  @override
  StudentModel? get studentModel {
    _$studentModelAtom.reportRead();
    return super.studentModel;
  }

  @override
  set studentModel(StudentModel? value) {
    _$studentModelAtom.reportWrite(value, super.studentModel, () {
      super.studentModel = value;
    });
  }

  final _$loadingStudentPageAtom =
      Atom(name: '_StudentStore.loadingStudentPage');

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

  final _$valorRatioAtom = Atom(name: '_StudentStore.valorRatio');

  @override
  int get valorRatio {
    _$valorRatioAtom.reportRead();
    return super.valorRatio;
  }

  @override
  set valorRatio(int value) {
    _$valorRatioAtom.reportWrite(value, super.valorRatio, () {
      super.valorRatio = value;
    });
  }

  final _$fetchAllStudentsAsyncAction =
      AsyncAction('_StudentStore.fetchAllStudents');

  @override
  Future<void> fetchAllStudents(String course) {
    return _$fetchAllStudentsAsyncAction
        .run(() => super.fetchAllStudents(course));
  }

  final _$fetchStudentByIdAsyncAction =
      AsyncAction('_StudentStore.fetchStudentById');

  @override
  Future<void> fetchStudentById(String matricula) {
    return _$fetchStudentByIdAsyncAction
        .run(() => super.fetchStudentById(matricula));
  }

  final _$_StudentStoreActionController =
      ActionController(name: '_StudentStore');

  @override
  void filterMatricula(String value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.filterMatricula');
    try {
      return super.filterMatricula(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorRatio(int value) {
    final _$actionInfo = _$_StudentStoreActionController.startAction(
        name: '_StudentStore.setValorRatio');
    try {
      return super.setValorRatio(value);
    } finally {
      _$_StudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
studentModel: ${studentModel},
loadingStudentPage: ${loadingStudentPage},
valorRatio: ${valorRatio}
    ''';
  }
}
