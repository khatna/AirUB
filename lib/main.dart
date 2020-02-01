import 'package:flutter/material.dart';
import 'package:airub/screens/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2196F3),
        primaryColorLight: Color(0xFFBBDEFB),
        primaryColorDark: Color(0xFF1976D2),
        accentColor: Color(0xFF03A9F4),
        fontFamily: 'Oswald',
      ),
      home: LoadingScreen(),
    );
  }
}
