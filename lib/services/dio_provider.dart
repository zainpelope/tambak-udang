import 'package:dio/dio.dart';
export './dio_provider.dart';

Dio http = Dio(BaseOptions(baseUrl: "http://localhost:8000/api"))
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));