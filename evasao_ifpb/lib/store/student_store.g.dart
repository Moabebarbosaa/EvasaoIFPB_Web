// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentStore on _StudentStore, Store {
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

  final _$studentsCountAtom = Atom(name: '_StudentStore.studentsCount');

  @override
  int get studentsCount {
    _$studentsCountAtom.reportRead();
    return super.studentsCount;
  }

  @override
  set studentsCount(int value) {
    _$studentsCountAtom.reportWrite(value, super.studentsCount, () {
      super.studentsCount = value;
    });
  }

  final _$fetchAllStudentsAsyncAction =
      AsyncAction('_StudentStore.fetchAllStudents');

  @override
  Future<void> fetchAllStudents(String course) {
    return _$fetchAllStudentsAsyncAction
        .run(() => super.fetchAllStudents(course));
  }

  @override
  String toString() {
    return '''
loadingStudentPage: ${loadingStudentPage},
studentsCount: ${studentsCount}
    ''';
  }
}
