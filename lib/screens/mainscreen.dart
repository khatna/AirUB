import 'package:flutter/material.dart';
import 'package:airub/components/report.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int idx = 178;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          this.setState(() {
            idx = 32;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/bg.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Color(0xAA000000),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: Report(idx: this.idx)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
