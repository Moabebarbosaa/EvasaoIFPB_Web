import 'package:dio/dio.dart';

const kBaseUrl = 'http://143.198.112.106:3000';
const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNreWM1YXI0YzAwMTRvaGl4dzR0ZXhzeGoiLCJlbWFpbCI6ImFkbWluQGFkbWluLmNvbSIsInJvbGUiOiJBRE1JTiIsInN0YXR1cyI6dHJ1ZSwiaWF0IjoxNjQyMDI4NDY4LCJleHAiOjE2NDIyMDEyNjh9.ecyhDmzRfQ0Q94PgocyhBItLkwxjEO7uhiGf_AL72rI';

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {
      'Authorization' : 'Bearer $token',
    }
);
