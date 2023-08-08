import 'package:dio/dio.dart';
export './dio_provider.dart';

Dio http = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8001/api"))
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));