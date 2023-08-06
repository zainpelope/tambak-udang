import 'dart:async';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tambak_undang/services/report_service.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/splash/splash.dart';

import 'dashboard/dashborad.dart';

final today = DateUtils.dateOnly(DateTime.now());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID');
  initializeDateSymbol();
  runApp(const MyApp());
  Timer.periodic(const Duration(hours: 2), (Timer t) => getCurrentReport().then((value) => value.fold((l) => SharedPref.saveCurrentReport(l), (r) => null)));
}

void initializeDateSymbol() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambak Udang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreenPage(),
    );
  }
}


