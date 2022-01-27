import 'package:dio/dio.dart';

const kBaseUrl = 'http://143.198.112.106:3000';
const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRlZTc2NDBmLTUwYzktNDM2ZS1hNTRjLTlkYjg1ZTQ1YTIzMiIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwicm9sZSI6IkFETUlOIiwic3RhdHVzIjp0cnVlLCJpYXQiOjE2NDMzMTUwNzUsImV4cCI6MTY0MzQ4Nzg3NX0.MJvsbmInHYP7wDb3zf6Wqspig-cNgkCO14VfwwpLMC8";

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {
      'Authorization' : 'Bearer $token',
    }
);

//http://127.0.0.1:5000/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/1.0/2.0
final metricsOptions = BaseOptions(
    baseUrl: 'http://143.198.112.106:8000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
);
