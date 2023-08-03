import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tambak_undang/air/air.dart';
import 'package:tambak_undang/salinitas/salinitas.dart';
import 'package:tambak_undang/widget/app_button.dart';

import '../ph/ph.dart';
import '../suhu/suhu.dart';
import '../theme/img_string.dart';

class TombolDashboard extends StatelessWidget {
  const TombolDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                gambar: ImgString.suhu,
                teks: 'Temp.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Suhu(),
                    ),
                  );
                },
              ),
              AppButton(
                gambar: ImgString.salinitas,
                teks: 'Salinitas.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Salinitas(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                gambar: ImgString.ph,
                teks: 'pH.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Ph(),
                    ),
                  );
                },
              ),
              AppButton(
                gambar: ImgString.air,
                teks: 'Volume.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Air(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
