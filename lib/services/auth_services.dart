import "package:dartz/dartz.dart";
import "package:dio/dio.dart";
import "package:tambak_undang/services/dio_provider.dart";
import "package:tambak_undang/services/sharedpref.dart";

Future<Either<String, String>> loginService({required String username, required String password}) async {
  const String errMsg = "Terjadi kesalahan pada server!";
  try {
    final Response response = await http.post("/auth/login", data: ({
      "username": username,
      "password": password
    }));
    if (response.statusCode == 200) {
      final String message = response.data["message"];
      final  data = response.data["data"] as Map<String, dynamic>;
      SharedPref.saveUsername(data["username"]);
      SharedPref.saveToken(data["token"]);
      return Left(message);
    }
    return const Right(errMsg);
  } on DioException catch (e) {
    return Right(e.message ?? e.response?.data["message"] ?? errMsg);
  }
}