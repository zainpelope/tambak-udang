import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tambak_undang/theme/img_string.dart';
import 'package:tambak_undang/widget/profile.dart';
import 'package:tambak_undang/widget/tanggal.dart';

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
      body: Stack(
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
          const Tanggal(),
          const Padding(
            padding: EdgeInsets.only(top: 390.0),
            child: AppButton(),
          ),
        ],
      ),
    );
  }
}
