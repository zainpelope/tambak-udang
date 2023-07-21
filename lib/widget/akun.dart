import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tambak_undang/login/login.dart';

import '../theme/app_color.dart';
import '../theme/img_string.dart';

class Akun extends StatelessWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColor.blue,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.bg,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 100,
                      child: Icon(Icons.person,size: 200,color: Colors.black26,),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Lukmanul Hakim",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "hakimlukman3009@gmail.com",
                      style: TextStyle(fontSize: 12,fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blue,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const FormLogin()));
                },
                child: const Text('Logout'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
