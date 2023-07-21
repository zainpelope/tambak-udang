import 'package:flutter/material.dart';
import 'package:tambak_undang/ph/ph.dart';
import 'package:tambak_undang/salinitas/salinitas.dart';
import 'package:tambak_undang/theme/app_font.dart';

import '../air/air.dart';
import '../suhu/suhu.dart';
import '../theme/img_string.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Jumlah kolom dalam grid
      crossAxisCount: 2,
      // Spasi antar elemen dalam grid
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      // Padding di sekitar grid
      padding: const EdgeInsets.all(25.0),
      // Daftar elemen yang akan ditampilkan dalam grid
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Suhu()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  ImgString.suhu,
                  height: 69,
                  width: 69,
                ),
                const Text(
                  'Temp.',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Salinitas()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  ImgString.salinitas,
                  height: 99,
                  width: 100,
                ),
                const Text(
                  'Salinitas.',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ph()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  ImgString.ph,
                  height: 69,
                  width: 69,
                ),
                const Text(
                  'pH.',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Air()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  ImgString.air,
                  height: 69,
                  width: 69,
                ),
                const Text(
                  'Volume.',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
