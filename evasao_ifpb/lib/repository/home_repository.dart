import 'package:dio/dio.dart';
import 'package:evasao_ifpb/core/api.dart';
import 'package:evasao_ifpb/model/all_students_model.dart';
import 'package:evasao_ifpb/model/data_model.dart';
import 'package:evasao_ifpb/model/student_model.dart';

class HomeRepository {
  final Dio _dio = Dio(kDioOptions);

  Future<DataModel> fetchDataAllCourse(String filter) async {
    try {
      final response = await _dio.get('/historic/filter?periodo=2020_1&$filter');http://143.198.112.106:3000/historic/filter?periodo=2020_1
      final model = DataModel.fromMap(response.data);
      return model;
    } catch (e) {
      return Future.error('Error: Home_Repository');
    }
  }


}