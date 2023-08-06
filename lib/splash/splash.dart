import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tambak_undang/dashboard/dashborad.dart';
import 'package:tambak_undang/services/report_service.dart';
import 'package:tambak_undang/services/sharedpref.dart';
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
    getCurrentReport().then((value) => value.fold((l) => SharedPref.saveCurrentReport(l), (r) => null));
    Timer(
      const Duration(
        seconds: 5,
      ),
      () {
        setState(() {
          _isLoading = false;
        });
        if (SharedPref.getToken == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FormLogin(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  Dashboard(),
            ),
          );
        }
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImgString.splash,
                      height: 170,
                      width: 170,
                    ),
                    Text(
                      "Harta Timur Daya",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              if (_isLoading)
                SpinKitWaveSpinner(
                  color: AppColor.blue,
                  size: 50.0,
                  duration: Duration(milliseconds: 2500),
                ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
