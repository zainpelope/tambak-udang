import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tambak_undang/kalender/kalender.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/tabel/tabel_suhu.dart';
import 'package:tambak_undang/widget/parameter.dart';

import 'package:tambak_undang/theme/app_color.dart';
import '../theme/img_string.dart';
import '../widget/profile.dart';

class Suhu extends StatefulWidget {
  const Suhu({Key? key}) : super(key: key);

  @override
  State<Suhu> createState() => _SuhuState();
}

class _SuhuState extends State<Suhu> {
  Timer? timer;
  ReportModel? currentReport;

  void loadData() => setState(() => currentReport = SharedPref.getCurrentReport);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 30), (timer) => loadData());
    loadData();
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
          "Temperature",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
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
              text1: "${currentReport?.suhu ?? "..."}°",
              img: ImgString.suhu,
              text2: "Suhu.",
            ),
            const Padding(
              padding: EdgeInsets.only(top: 340.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [Text("Dari Tanggal"), Kalender()],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [Text("Sampai Tanggal"), Kalender()],
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
                  onPressed: () {},
                  child: const Text("Apply"),
                ),
              ),
            ),
            TabelSuhu(),
          ],
        ),
      ),
    );
  }
}
