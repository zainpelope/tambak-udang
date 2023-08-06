// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
    String id;
    String ph;
    String suhu;
    int salinitas;
    int ketinggianAir;
    DateTime createdAt;

    ReportModel({
        required this.id,
        required this.ph,
        required this.suhu,
        required this.salinitas,
        required this.ketinggianAir,
        required this.createdAt,
    });

    factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json["id"],
        ph: json["ph"],
        suhu: json["suhu"],
        salinitas: json["salinitas"],
        ketinggianAir: json["ketinggianAir"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ph": ph,
        "suhu": suhu,
        "salinitas": salinitas,
        "ketinggianAir": ketinggianAir,
        "createdAt": createdAt.toIso8601String(),
    };
}
