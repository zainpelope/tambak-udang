import 'package:flutter/material.dart';

import 'package:tambak_undang/widget/parameter.dart';

import 'package:tambak_undang/theme/app_color.dart';
import '../kalender/kalender.dart';
import '../tabel/tabel_salinitas.dart';
import '../theme/img_string.dart';
import '../widget/profile.dart';

class Salinitas extends StatelessWidget {
  const Salinitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text(
          "Salinitas",
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
            const Parameter(
              text1: "35",
              img: ImgString.salinitas,
              text2: "Salinitas",
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
            TabelSalinitas(),

          ],
        ),
      ),
    );
  }
}
