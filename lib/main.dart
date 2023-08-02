import 'package:flutter/material.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.init();
  runApp(const MyApp());
}

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
