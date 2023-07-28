import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tanggal extends StatelessWidget {
  const Tanggal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: 200,
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kamis, 28 Juli 2023",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("TEMP "),
                      SizedBox(
                        height: 20,
                      ),
                      Text("SALINITAS "),
                      SizedBox(
                        height: 20,
                      ),
                      Text("pH "),
                      SizedBox(
                        height: 20,
                      ),
                      Text("KETINGGIAN AIR "),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(" : 28 C "),
                      SizedBox(
                        height: 20,
                      ),
                      Text(" : 35 ppt "),
                      SizedBox(
                        height: 20,
                      ),
                      Text(" : 6,5 "),
                      SizedBox(
                        height: 20,
                      ),
                      Text(" : 120 cm"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
