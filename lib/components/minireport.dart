import 'package:flutter/material.dart';
import 'package:airub/services/resources.dart';

const String apiKey = '4400e7a2a3f4ff44c525ee690f8693a830c5900e';

class MiniReport extends StatefulWidget {
  final dynamic data;

  MiniReport({this.data});

  @override
  _MiniReportState createState() => _MiniReportState();
}

class _MiniReportState extends State<MiniReport> {
  int id, aqi;
  Color color = Colors.white;
  String name = '';

  initState() {
    setState(() {
      id = widget.data['data']['idx'];
      var x = widget.data['data']['aqi'];

      if (x is int) {
        aqi = x;
        color = getColor(aqi);
      }

      name = names[id];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: this.color,
          width: 3.0,
        ),
//        color: Color(0x80FFFFFF),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: Text(
              '${this.aqi ?? 'N/A'}',
              style: TextStyle(
                  color: this.color,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            child: Text(
              this.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
