import 'package:evasao_ifpb/model/student_model.dart';
import 'package:evasao_ifpb/repository/students_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_store.g.dart';

class StudentStore = _StudentStore with _$StudentStore;

abstract class _StudentStore with Store {
  _StudentStore() {
    autorun((_) async {
      await loadScreen();
    });
  }

  ObservableList<StudentModel> students = ObservableList<StudentModel>();

  @observable
  bool loadingStudentPage = true;

  @observable
  int studentsCount = 0;

  @action
  Future<void> _fetchAllStudents() async {
    try {
      final resultStudents = await StudentsRepository().fetchAllStudents();
      students.addAll(resultStudents.students);
      studentsCount = students.length;
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadScreen() async {
    loadingStudentPage = true;
    await _fetchAllStudents();
    loadingStudentPage = false;
  }

}