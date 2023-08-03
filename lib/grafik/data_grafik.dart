import 'package:flutter/material.dart';
import 'package:tambak_undang/kalender/kalender.dart';
import 'package:tambak_undang/tabel/tabel_suhu.dart';
import 'package:tambak_undang/widget/grafik.dart';
import 'package:tambak_undang/widget/parameter.dart';

import 'package:tambak_undang/theme/app_color.dart';
import '../theme/img_string.dart';
import '../widget/profile.dart';

class DataGrafik extends StatelessWidget {
  const DataGrafik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text(
          "Data Grafik",
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
            const Padding(
              padding: EdgeInsets.only(top: 200.0),
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
              padding: const EdgeInsets.only(top: 280.0),
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


          ],
        ),
      ),
    );
  }
}
