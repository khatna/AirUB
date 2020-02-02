import 'package:flutter/material.dart';
import 'package:airub/screens/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Oswald'),
      home: LoadingScreen(),
    );
  }
}
