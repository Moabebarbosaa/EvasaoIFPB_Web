import 'package:dio/dio.dart';
import 'package:evasao_ifpb/core/api.dart';
import 'package:evasao_ifpb/model/metrics_model.dart';

class MetricsRepository {
  final Dio _dio = Dio(metricsOptions);

  Future<MetricsModel> fetchProbability() async {
    try {
      final response = await _dio.get('/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/2.0');
      final model = MetricsModel.fromMap(response.data);
      return model;
    } catch (e) {
      print('ERROR $e');
      return Future.error('Error: Metrics_Repository');
    }
  }
}