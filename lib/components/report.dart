import 'package:flutter/material.dart';
import 'package:airub/services/network.dart';
import 'package:airub/services/resources.dart' as resources;
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = '4400e7a2a3f4ff44c525ee690f8693a830c5900e';


class Report extends StatefulWidget {
  final int id;

  Report({this.id});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool summary = true;

  Color color = Colors.white;
  String name = '', desc = '';
  int aqi;

  void getData() async {
    var url = 'https://api.waqi.info/feed/@${widget.id}/?token=$apiKey';
    NetworkUtils res = NetworkUtils(url);
    var temp = await res.getData();

    if (this.mounted) {
      setState(() {
        this.aqi = temp['data']['aqi'];
        this.color = resources.getColor(this.aqi);
        this.desc = resources.getDesc(this.aqi);
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
    return GestureDetector(
      onTap: () {
        setState(() {
          summary = !summary;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 220.0,
                height: 220.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: this.color,
                    width: 8.0,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Center(
                  child: AnimatedCrossFade(
                    crossFadeState: this.summary
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 200),
                    firstChild: Text(
                      '${this.aqi}',
                      style: TextStyle(
                        color: this.color,
                        fontSize: 96.0,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    secondChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Агаарын Чанар: ${this.aqi}',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                this.desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.0),
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
