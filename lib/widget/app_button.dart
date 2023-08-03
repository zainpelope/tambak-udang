import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String gambar;
  final String teks;
  final Function() onTap;
  const AppButton({
    super.key,
    required this.gambar,
    required this.teks,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 165,
        width: 165,
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
              gambar,
              height: 69,
              width: 69,
            ),
            Text(
              teks,
              style: const TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
