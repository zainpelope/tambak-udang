import 'package:flutter/material.dart';
import 'package:tambak_undang/widget/akun.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 100.0,
        left: 25.0,
        right: 25.0,
      ),
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
      height: 80.0,
      width: double.infinity,
      child: Center(
        child: ListTile(
          title: const Text("Lukmanul Hakim"),
          subtitle: const Text(
            "login as admin",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Akun()));
            },
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.black45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
