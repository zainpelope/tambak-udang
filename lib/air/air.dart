import 'package:flutter/material.dart';
import 'package:tambak_undang/widget/parameter.dart';
import 'package:tambak_undang/widget/tabel.dart';
import 'package:tambak_undang/theme/app_color.dart';
import '../theme/img_string.dart';
import '../widget/profile.dart';

class Air extends StatelessWidget {
  const Air({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text(
          "Water Volume",
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
              text1: "120",
              img: ImgString.air,
              text2: "Volume.",
            ),
            Tabel(),
          ],
        ),
      ),
    );
  }
}
