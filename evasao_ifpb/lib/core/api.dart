import 'package:dio/dio.dart';

const kBaseUrl = 'http://143.198.112.106:3000';
const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImI0NDViZDBkLWE2Y2YtNDgxOS1iMWVjLWJjMDY5NjY2ZWEwZCIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwicm9sZSI6IkFETUlOIiwic3RhdHVzIjp0cnVlLCJpYXQiOjE2NDI0NjAzMzQsImV4cCI6MTY0MjYzMzEzNH0.Srmm4LAgCPI6S81wxet3n1IAEeLRbG8UPjIAVwT2A0M';

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {
      'Authorization' : 'Bearer $token',
    }
);
