import 'package:flutter/material.dart';
import 'package:learning_app_73azn/module/current_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Stack(children: [Text("hello")])),
    );
  }
}
