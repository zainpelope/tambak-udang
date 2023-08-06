import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tambak_undang/dashboard/tombol_dashboard.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/theme/img_string.dart';
import 'package:tambak_undang/widget/profile.dart';
import 'package:tambak_undang/widget/semua_data_dashboard.dart';

import '../theme/app_color.dart';
import '../widget/app_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
            SemuaDataDashboard(),
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
