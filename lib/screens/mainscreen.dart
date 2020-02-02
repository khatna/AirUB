import 'package:flutter/material.dart';
import 'package:airub/components/report.dart';
import 'package:airub/components/minireport.dart';

class MainScreen extends StatefulWidget {
  final List<dynamic> results;

  MainScreen(this.results);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int highlight;
  List<Widget> list = [];

  @override
  void initState() {
    this.highlight = widget.results[0];
    setState(() {
      for (int i in widget.results) {
        list.add(
          GestureDetector(
            onTap: () {
              print(i);
              setState(() {
                this.highlight = i;
              });
            },
            child: MiniReport(i),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
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
                Expanded(
                  flex: 4,
                  child: Report(id: this.highlight),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: this.list,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
