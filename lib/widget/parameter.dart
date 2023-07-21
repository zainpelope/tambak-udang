import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/img_string.dart';

class Parameter extends StatelessWidget {
  const Parameter(
      {Key? key, required this.text1, required this.img, required this.text2})
      : super(key: key);
  final String text1;
  final String img;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: Container(
        margin: const EdgeInsets.all(25),
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
        height: 130,
        width: double.infinity,
        child: Row(
          children: [
             Expanded(
              child: Center(
                child: Text(
                  text1,
                  style: TextStyle(fontSize: 95),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    img,
                    height: 59,
                    width: 100,
                  ),
                   Text(
                    text2,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
