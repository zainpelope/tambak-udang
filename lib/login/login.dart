import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/img_string.dart';


class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.bg,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      backgroundColor: AppColor.bg,
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImgString.logo,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 70,
              width: 240,
              decoration: BoxDecoration(
                color: AppColor.suhu,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.face),
                  Text("Suhu"),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 240,
              decoration: BoxDecoration(
                color: AppColor.salinitas,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.face),
                  Text("Salinitas"),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 240,
              decoration: BoxDecoration(
                color: AppColor.ph,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.face),
                  Text("pH"),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 240,
              decoration: BoxDecoration(
                color: AppColor.air,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.face),
                  Text("Ketinggian Air"),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
