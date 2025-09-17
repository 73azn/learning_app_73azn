import 'package:flutter/material.dart';
import 'package:learning_app_73azn/module/current_user.dart';
import 'package:learning_app_73azn/module/users.dart';
import 'package:learning_app_73azn/screens/home_screen.dart';
import 'package:learning_app_73azn/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final Users _usersDB = Users();
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            spacing: 10,
            children: [
              Image.asset("assets/img/signup.png", width: 343, height: 253),
              Text(
                "Signup",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text("login with sociak networks"),
              Image.asset("assets/img/Social_Buttons.png"),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your name";
                        }
                      },
                      decoration: InputDecoration(hint: Text("name")),
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(hint: Text("Email")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your email";
                        }
                        if (_usersDB.userIn(value)) {
                          return "this email exist";
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
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          User.name = name.text;
                          User.email = email.text;
                          _usersDB.addUser(
                            email.text,
                            password.text,
                            name.text,
                            name.text,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: Text("Sign up"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      child: Text("Login"),
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
