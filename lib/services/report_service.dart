import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/dio_provider.dart';
import 'package:tambak_undang/services/sharedpref.dart';

Future<Either<ReportModel, String>> getCurrentReport() async {
  try {
    final Response response = await http.get(
      "/report/current", 
      options: Options(headers: {
        "Authorization": "Bearer ${SharedPref.getToken}"
      }));
    if (response.statusCode == 200) return Left(ReportModel.fromJson(response.data["data"]));
    return Right(response.data["message"] ?? "Tidak ada data");
  } on DioException catch (e) {
    print(e);
    return const Right("Terjadi kesalahan saat mengambil data laporan terbaru");
  }
}

Future<Either<List<ReportModel>, String>> getAllReport() async {
  try {
    final Response response = await http.get(
      "/report/all", 
      options: Options(headers: {
        "Authorization": "Bearer ${SharedPref.getToken}"
      }));
    if (response.statusCode == 200) return Left((response.data["data"] as List).map((e) => ReportModel.fromJson(e)).toList());
    return Right(response.data["message"] ?? "Tidak ada data");
  } on DioException catch (e) {
    print(e);
    return const Right("Terjadi kesalahan saat mengambil data laporan");
  }
}

Future<Either<List<ReportModel>, String>> getReportByRange({required String from, required String to}) async {
  try {
    final Response response = await http.get(
      "/report/range?from=$from&to=$to", 
      options: Options(headers: {
        "Authorization": "Bearer ${SharedPref.getToken}"
      }));
    if (response.statusCode == 200) return Left((response.data["data"] as List).map((e) => ReportModel.fromJson(e)).toList());
    return Right(response.data["message"] ?? "Tidak ada data");
  } on DioException catch (e) {
    print(e);
    return const Right("Terjadi kesalahan saat mengambil data laporan");
  }
}