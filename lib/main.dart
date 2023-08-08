import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/splash/splash.dart';

final today = DateUtils.dateOnly(DateTime.now());

void main() async {
  Intl.defaultLocale = "id_ID";
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  initializeDateSymbol();
  runApp(const MyApp());
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
      home: const SplashScreenPage(),
    );
  }
}
