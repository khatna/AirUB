import 'package:flutter/material.dart';
import 'package:airub/components/report.dart';
import 'package:airub/components/minireport.dart';

class MainScreen extends StatefulWidget {
  final List<Future> requests;

  MainScreen(this.requests);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int highlight;
  List<Future> reqs;
  List<Widget> list;

  @override
  void initState() {
    highlight = 0;
    reqs = widget.requests;

    list = [];
    for (var i = 0; i < reqs.length; i++) {
      Widget fb = FutureBuilder(
        future: reqs[i],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              child: MiniReport(data: snapshot.data),
              onTap: () {
                setState(() {
                  this.highlight = i;
                });
              },
            );
          } else {
            return SizedBox();
          }
        },
      );

      list.add(fb);
    }

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
                Text('${this.highlight}'),
                Expanded(
                  flex: 4,
                  child: FutureBuilder(
                    key: ValueKey<int>(highlight),
                    future: reqs[highlight],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Report(data: snapshot.data);
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: this.list,
                    ),
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
