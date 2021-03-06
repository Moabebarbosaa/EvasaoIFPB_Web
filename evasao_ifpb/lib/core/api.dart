import 'package:dio/dio.dart';

const kBaseUrl = 'https://api.idzero.com.br/';
const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU4Y2ZmYjFmLTBjYmEtNGE3NC1hZWZiLWY3ZTUyZWJlMjg3MCIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwicm9sZSI6IkFETUlOIiwic3RhdHVzIjp0cnVlLCJpYXQiOjE2NDM2Njc0ODEsImV4cCI6MTcxMjc4NzQ4MX0.YVcJjAJShASoqUx6DVlAdPPDYATvAb4rIvyun00brIU";

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {
      'Authorization' : 'Bearer $token',
    }
);

final metricsOptions = BaseOptions(
    baseUrl: 'https://apimodelo.idzero.com.br/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
);
