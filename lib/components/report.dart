import 'package:flutter/material.dart';
import 'package:airub/services/resources.dart';

class Report extends StatefulWidget {
  final dynamic data;

  Report({this.data});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool summary = false;

  int id, aqi;
  Color color = Colors.white;
  String name = '', desc = '';

  initState() {
    setState(() {
      id = widget.data['data']['idx'];

      var x = widget.data['data']['aqi'];
      if (x is int) {
        aqi = x;
        color = getColor(aqi);
        desc = getDesc(aqi);
      }

      name = names[id];
    });

    super.initState();
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
                      '${aqi ?? 'N/A'}',
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
                          'Агаарын Чанар: ${aqi ?? 'N/A'}',
                          style: TextStyle(
                            color: this.color,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: this.color, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: this.color, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: this.color, fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: this.color, fontSize: 16.0),
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
