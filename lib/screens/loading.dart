import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:airub/services/network.dart';
import 'package:airub/screens/mainscreen.dart';

const String urlSearch = 'https://api.waqi.info/nsearch/station/ulaanbaatar';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getStations() async {
    NetworkUtils res = NetworkUtils(urlSearch);
    var data = await res.getData();
    List<int> results = [];

    for (var arr in data['results']) {
      results.add(arr['x']);
    }

    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MainScreen(results)),
    );
  }

  @override
  void initState() {
    super.initState();
    getStations();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: SpinKitDoubleBounce(
        color: Colors.white,
      ),
    );
  }
}
