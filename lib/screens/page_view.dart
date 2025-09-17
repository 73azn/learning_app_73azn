import 'package:flutter/material.dart';
import 'package:learning_app_73azn/screens/login_screen.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<StatefulWidget> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  static const double _HEIGHT = 264;
  static const double _WIDTH = 275;
  static final PageController controller = PageController();
  static final List<Image> _bars = [
    Image.asset("assets/img/bar1.png"),
    Image.asset("assets/img/bar2.png"),
    Image.asset("assets/img/bar2.png"),
  ];
  List<Widget> sweeper = [
    Center(
      child: Pages(
        Image.asset("assets/img/page1.png", height: _HEIGHT, width: _WIDTH),
        "Learn anytime and anywhere",
        "Quarantine is the perfect time to spend yourday learning something new, from anywhere!",
      ),
    ),
    Center(
      child: Pages(
        Image.asset("assets/img/page2.png"),
        "find course for you",
        "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
      ),
    ),
    Center(
      child: Pages(
        Image.asset("assets/img/page3.png"),
        "Improve your skils",
        "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
      ),
    ),
  ];
  Image bar = _bars[0];
  int _cur = 0;
  String _bt = "next";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (n) {
                  setState(() {
                    bar = _bars[n];
                    _cur = n;
                    if (_cur == 2) {
                      _bt = "Let's start";
                    } else {
                      _bt = "next";
                    }
                  });
                },
                children: sweeper,
              ),
            ),
            Expanded(flex: 1, child: bar),

            ElevatedButton(
              onPressed: () {
                if (_cur == 3) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
                if (_cur < 2) {
                  _bt = "next";
                  _cur += 1;

                  controller.nextPage(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeInSine,
                  );
                }
                if (_cur == 2) {
                  _bt = "Let's start";
                  _cur += 1;
                }

                setState(() {});
              },
              child: Text(_bt),
            ),
          ],
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final Image image;
  final String text;
  final String des;
  const Pages(this.image, this.text, this.des, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        Text(text, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        Text(des),
      ],
    );
  }
}
