import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../login/login.dart';
import '../theme/app_color.dart';
import '../theme/img_string.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        seconds: 10,
      ),
      () {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FormLogin(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
            Container(
            height: 600,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImgString.logo,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
              if (_isLoading)
                const Expanded(
                  child: SpinKitWaveSpinner(
                    color: Colors.green,
                    size: 100.0,
                    duration: Duration(milliseconds: 2500),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "KELOMPOK USAHA HARTA TIMUR DAYA DESA ROMBEN BARAT SUMENEP",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
