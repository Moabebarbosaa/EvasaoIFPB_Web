import 'package:dio/dio.dart';
import 'package:evasao_ifpb/core/api.dart';
import 'package:evasao_ifpb/model/all_students_model.dart';

class StudentsRepository {
  final Dio _dio = Dio(kDioOptions);

  Future<AllStudentsModel> fetchAllStudents() async {
    try {
      final response = await _dio.get('/students');
      final model = AllStudentsModel.fromMap(response.data);
      return model;
    } catch (e) {
      return Future.error('Error: Repository');
    }
  }

}