import 'package:flutter/material.dart';
import 'package:learning_app_73azn/module/current_user.dart';
import 'package:learning_app_73azn/module/users.dart';
import 'package:learning_app_73azn/screens/home_screen.dart';
import 'package:learning_app_73azn/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final Users _usersDB = Users();

  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            spacing: 10,
            children: [
              Image.asset("assets/img/login.png", width: 343, height: 253),
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text("login with sociak networks"),
              Image.asset("assets/img/Social_Buttons.png"),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(hint: Text("Email")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your email";
                        }
                        if (!_usersDB.userIn(value)) {
                          return "invalid email or email not exist";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(hint: Text("Password")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter password";
                        }
                        if (_usersDB.userIn(email.text) &&
                            !_usersDB.passwordCorrect(email.text, value)) {
                          return "incorrect password";
                        }
                        return null;
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Forget Passwrod?"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          User.name = _usersDB.users[email.text]!["name"];
                          User.email = email.text;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: Text("Login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
