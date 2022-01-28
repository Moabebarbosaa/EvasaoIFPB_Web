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
  StudentModel? studentModel;

  @observable
  bool loadingStudentPage = true;

  @action
  Future<void> fetchAllStudents(String course) async {
    try {
      loadingStudentPage = true;
      final resultStudents = await StudentsRepository().fetchAllStudents(course);
      if (students.isNotEmpty) students = ObservableList<StudentModel>();
      students.addAll(resultStudents.students);
      loadingStudentPage = false;
    } catch (e) {
      loadingStudentPage = true;
      print(e);
    }
  }

  @action
  Future<void> filterMatriculas(String matricula) async {
    try {
      loadingStudentPage = true;

      print(students[0].matricula.contains(matricula));

      loadingStudentPage = false;
    } catch (e) {
      loadingStudentPage = true;
      print(e);
    }
  }

  @action
  Future<void> fetchStudentById(int id) async {
    try {
      loadingStudentPage = true;
      final result = await StudentsRepository().fetchStudentById(id);
      studentModel = result;
      loadingStudentPage = false;
    } catch (e) {
      loadingStudentPage = true;
      print(e);
    }
  }

  Future<void> loadScreen() async {
    loadingStudentPage = true;
    await fetchAllStudents('computacao');
    loadingStudentPage = false;
  }

}