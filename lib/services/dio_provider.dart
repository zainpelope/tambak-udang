import 'package:dio/dio.dart';
export './dio_provider.dart';

Dio http = Dio(BaseOptions(baseUrl: "https://neatly-discrete-titmouse.ngrok-free.app/api"))
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));