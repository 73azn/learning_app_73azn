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
      body: SafeArea(
        child: Column(
          children: [
            AppBar(title: Text("Hello,")),
            Row(
              children: [
                SizedBox(width: 15),
                Text(
                  "${User.name}",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                Expanded(child: SizedBox()),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
            SearchBar(
              hintText: "search course",
              trailing: <Widget>[Icon(Icons.search)],
            ),
            Row(
              spacing: 10,
              children: [
                Text("Catagory:"),
                Chip(
                  label: Text("CSS"),
                  color: WidgetStatePropertyAll(Colors.blueAccent),
                ),
                Chip(
                  label: Text("UX"),
                  color: WidgetStatePropertyAll(Colors.blueAccent),
                ),
                Chip(
                  label: Text("SWIFT"),
                  color: WidgetStatePropertyAll(Colors.blueAccent),
                ),
                Chip(
                  label: Text("UI"),
                  color: WidgetStatePropertyAll(Colors.blueAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
