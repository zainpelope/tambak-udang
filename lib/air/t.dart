import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';

class Okey extends StatelessWidget {
  const Okey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sbd"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormLogin()));
        },
        child: Text("masuk"),
      ),
    );
  }
}
