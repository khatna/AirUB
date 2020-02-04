import 'package:flutter/material.dart';
import 'package:airub/screens/loading.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Oswald'),
      home: LoadingScreen(),
    );
  }
}
