import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tambak_undang/dashboard/tombol_dashboard.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/report_service.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/theme/img_string.dart';
import 'package:tambak_undang/widget/profile.dart';
import 'package:tambak_undang/widget/semua_data_dashboard.dart';

import '../theme/app_color.dart';
import '../widget/app_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Timer? timer;
  ReportModel? currentReport;

  @override
  void initState() {
    super.initState();
    getCurrentReport().then((value) {
      value.fold((l) {
        setState(() => currentReport = l);
        SharedPref.saveCurrentReport(l);
      }, 
      (r) => _showSnackBar(r));
    });
    timer = Timer.periodic(
      const Duration(seconds: 5), 
      (Timer t) => getCurrentReport().then((value) {
        value.fold((l) {
          setState(() => currentReport = l);
          SharedPref.saveCurrentReport(l);
        }, 
        (r) => _showSnackBar(r));
      })
    );
  }

   void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text(
          "Dashboard",
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
            SemuaDataDashboard(currentReport: currentReport),
             const Padding(
              padding: EdgeInsets.only(top: 470.0),
              child: TombolDashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
