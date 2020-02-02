import 'package:flutter/material.dart';
import 'package:airub/services/network.dart';
import 'package:airub/services/resources.dart' as resources;
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = '4400e7a2a3f4ff44c525ee690f8693a830c5900e';

class MiniReport extends StatefulWidget {
  final int id;

  MiniReport(this.id);

  @override
  _MiniReportState createState() => _MiniReportState();
}

class _MiniReportState extends State<MiniReport> {
  Color color = Colors.white;
  String name;
  int aqi;

  void getData() async {
    var url = 'https://api.waqi.info/feed/@${widget.id}/?token=$apiKey';
    NetworkUtils res = NetworkUtils(url);
    var temp = await res.getData();

    if (this.mounted) {
      setState(() {
        this.aqi = temp['data']['aqi'];
        this.color = resources.getColor(this.aqi);
      });
    }
  }

  initState() {
    super.initState();
    setState(() {
      this.name = resources.names[widget.id];
    });
    getData();
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
              child: aqi != null
                  ? Text(
                      '$aqi',
                      style: TextStyle(
                          color: this.color,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    )
                  : SpinKitPulse(color: Colors.white, size: 36.0),
            ),
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
