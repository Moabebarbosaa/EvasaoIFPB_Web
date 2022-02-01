import 'package:dio/dio.dart';
import 'package:evasao_ifpb/core/api.dart';
import 'package:evasao_ifpb/model/all_students_model.dart';
import 'package:evasao_ifpb/model/student_model.dart';
import 'package:evasao_ifpb/model/testes/histogram_model.dart';

class StudentsRepository {
  final Dio _dio = Dio(kDioOptions);
  final Dio _dio2 = Dio(metricsOptions);


  Future<AllStudentsModel> fetchAllStudents(String course) async {
    try {
      final response = await _dio.get('/students/filter$course');
      final model = AllStudentsModel.fromMap(response.data);
      return model;
    } catch (e) {
      return Future.error('Error: AllStudents_Repository');
    }
  }

  Future<StudentModel> fetchStudentById(int id) async {
    try {
      final response = await _dio.get('/students/$id');
      final model = StudentModel.fromMap(response.data['result']);
      return model;
    } catch (e) {
      return Future.error('Error: StudentsByID_Repository');
    }
  }

  Future<Histograma_CRE> fetchHistogram() async {
    try {
      final response = await _dio2.get('/histograma');
      final model = Histograma_CRE.fromMap(response.data);
      return model;
    } catch (e) {
      return Future.error('Error: fetchHistogram_Repository');
    }
  }


}