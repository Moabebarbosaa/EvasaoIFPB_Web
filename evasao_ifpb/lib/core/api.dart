import 'package:dio/dio.dart';

const kBaseUrl = 'http://143.198.112.106:3000';
const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRlZTc2NDBmLTUwYzktNDM2ZS1hNTRjLTlkYjg1ZTQ1YTIzMiIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwicm9sZSI6IkFETUlOIiwic3RhdHVzIjp0cnVlLCJpYXQiOjE2NDMxNDE2MTEsImV4cCI6MTY0MzMxNDQxMX0.r4i1fabUpUmJaXPk8XPpVpRBfinkyPK8rUTKOpNaoYY";

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {
      'Authorization' : 'Bearer $token',
    }
);
