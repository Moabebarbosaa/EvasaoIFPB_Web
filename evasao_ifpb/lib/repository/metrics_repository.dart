import 'package:dio/dio.dart';
import 'package:evasao_ifpb/core/api.dart';
import 'package:evasao_ifpb/model/metrics_model.dart';

class MetricsRepository {
  final Dio _dio = Dio(metricsOptions);

  Future<MetricsModel> fetchProbability(String route) async {
    try {
      final response = await _dio.get(route);
      final model = MetricsModel.fromMap(response.data);
      return model;
    } catch (e) {
      print('ERROR $e');
      return Future.error('Error: Metrics_Repository');
    }
  }
}