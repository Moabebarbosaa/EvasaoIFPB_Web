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
  ObservableList<StudentModel> studentsAux = ObservableList<StudentModel>();

  @observable
  StudentModel? studentModel;

  @observable
  bool loadingStudentPage = true;

  @action
  void filterMatricula(String value) {
    loadingStudentPage = true;
    students.clear();
    students.addAll(studentsAux);
    students.removeWhere((student) => !student.matricula.contains(value));
    loadingStudentPage = false;
  }

  @observable
  int valorRatio = 0; //1:computacao | 2:contrucao | 3:fisica | 4:matematica | 5:telematica

  @action
  void setValorRatio(int value) {
    valorRatio = value;
  }

  @action
  Future<void> fetchAllStudents(String course) async {
    try {
      loadingStudentPage = true;
      final resultStudents = await StudentsRepository().fetchAllStudents(course);
      if (students.isNotEmpty) students = ObservableList<StudentModel>();
      students.addAll(resultStudents.students);
      studentsAux.addAll(resultStudents.students);
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
    await fetchAllStudents('');
    loadingStudentPage = false;
  }

}