import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  final int idx;

  Report({this.idx});

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool summary = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          summary = !summary;
        });
      },
      child: Container(
        margin: EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'БАЯНХОШУУ',
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
              SizedBox(height: 10.0),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orangeAccent.shade200,
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
                      '${this.widget.idx}',
                      style: TextStyle(
                        color: Colors.orangeAccent.shade200,
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
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent.shade200,
                              fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent.shade200,
                              fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent.shade200,
                              fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'PM2.5: 32',
                          style: TextStyle(
                              color: Colors.orangeAccent.shade200,
                              fontSize: 16.0),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Бохирдолтой',
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
