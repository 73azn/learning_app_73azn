import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/img/login.png"),
            Text("Login"),
            Text("login with sociak networks"),
            Image.asset("assets/img/Social_Buttons.png"),
          ],
        ),
      ),
    );
  }
}
