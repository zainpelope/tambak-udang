import 'package:flutter/material.dart';
import 'package:tambak_undang/services/auth_services.dart';
import '../dashboard/dashborad.dart';
import '../theme/app_color.dart';
import '../theme/img_string.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 138,
              ),
              Image.asset(
                ImgString.iot,
                height: 148,
                width: 270,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Username',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    suffixIcon: const Icon(
                      Icons.perm_identity,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),
                  obscureText: !_passwordVisible,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Text('Remember Login'),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blue,
                ),
                onPressed: isLoading ? null : _isChecked ? _login : null,
                child: isLoading ? const Text("Loading...") : const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    setState(() => isLoading = true);
    String username = _usernameController.text;
    String password = _passwordController.text;
    loginService(username: username, password: password).then((value) {
      value.fold(
        (success) {
          setState(() => isLoading = false);
          _showSnackBar(success);
           Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  Dashboard()), (r) => false,
          );
        }, 
        (err) {
          setState(() => isLoading = false);
          _showSnackBar(err);
        }
      );
    });
    // if (username == 'admin' && password == 'admin') {
    //   _showSnackBar('Login berhasil');
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const Dashboard()),
    //   );
    // } else {
    //   _showSnackBar('Username atau password salah');
    // }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
