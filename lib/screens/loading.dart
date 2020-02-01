import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:airub/services/network.dart';
import 'package:airub/screens/mainscreen.dart';

const String apiKey = '4400e7a2a3f4ff44c525ee690f8693a830c5900e';
const String urlSearch = 'https://api.waqi.info/nsearch/station/ulaanbaatar';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getStations() async {
    NetworkUtils res = NetworkUtils(urlSearch);
    var data = await res.getData();
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MainScreen()),
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
      color: Theme.of(context).primaryColor,
      child: SpinKitDoubleBounce(
        color: Colors.white,
      ),
    );
  }
}
