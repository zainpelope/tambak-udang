import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/report_service.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/tabel/tabel_ph.dart';

import 'package:tambak_undang/widget/parameter.dart';

import 'package:tambak_undang/theme/app_color.dart';
import '../kalender/kalender.dart';
import '../theme/img_string.dart';
import '../widget/profile.dart';

class Ph extends StatefulWidget {
  const Ph({Key? key}) : super(key: key);

  @override
  State<Ph> createState() => _PhState();
}

class _PhState extends State<Ph> {
  Timer? timer;
  ReportModel? currentReport;
  bool isLoading = false;
  List<ReportModel> dataTabel = [];
  DateTime? dateFrom;
  DateTime? dateTo;

  void getAllData() {
    setState(() => isLoading = true);
    getReportByRange(
      from: DateTime.now().toString().split(" ")[0],
      to: DateTime.now().toString().split(" ")[0]
    ).then((value) {
      value.fold(
        (l) => setState(() => dataTabel = l), 
        (r) => _showSnackBar(r));
      setState(() => isLoading = false);
    });
  }

  void getDataByRange() {
    if (dateFrom == null && dateTo == null) return;
    setState(() => isLoading = true);
    getReportByRange(
      from: dateFrom.toString().split(" ")[0], 
      to: dateTo.toString().split(" ")[0]
    ).then((value) {
      value.fold(
        (l) => setState(() => dataTabel = l), 
        (r) => _showSnackBar(r)
      );
      setState(() => isLoading = false);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void loadData() => setState(() => currentReport = SharedPref.getCurrentReport);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) => loadData());
    loadData();
    getAllData();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text(
          "Value pH ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: isLoading ? const PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: LinearProgressIndicator(), 
        ) : null,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              height: 140.0,
              width: double.infinity,
            ),
            const Profile(),
            Parameter(
              text1: currentReport?.ph ?? "...",
              img: ImgString.ph,
              text2: "pH.",
            ),
            Padding(
              padding: EdgeInsets.only(top: 340.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Dari Tanggal"), 
                        Kalender(
                          lastDate: DateTime.now().subtract(const Duration(days: 1)),
                          result: (date) => setState(() => dateFrom = date),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Sampai Tanggal"), 
                        Kalender(
                          firstDate: dateFrom?.add(const Duration(days: 1)),
                          lastDate: DateTime.now(),
                          result: (date) => setState(() => dateTo = date),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 425.0),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF8FCFFF,
                    ),
                  ),
                  onPressed: getDataByRange,
                  child: const Text("Apply"),
                ),
              ),
            ),
            TabelPh(data: dataTabel),
          ],
        ),
      ),
    );
  }
}
