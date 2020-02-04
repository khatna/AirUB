import 'package:flutter/material.dart';

const Map<int, String> names = {
  8642: 'АНУ-ын ЭСЯ',
  2576: 'НИСЭХ',
  2574: 'МҮОНРТ',
  4847: 'ТОЛГОЙТ',
  4848: 'АМГАЛАН',
  8599: '100 АЙЛ',
  2575: 'МИШЭЭЛ ЭКСПО',
  8600: 'МОНГОЛ ГАЗАР',
  9015: 'БАЯНХОШУУ'
};

Color getColor(int aqi) {
  if (aqi <= 50) {
    return Colors.lightGreenAccent;
  } else if (aqi <= 100) {
    return Colors.orangeAccent;
  } else if (aqi <= 200) {
    return Colors.deepOrangeAccent;
  } else if (aqi <= 300) {
    return Colors.red;
  } else if (aqi <= 400) {
    return Colors.purpleAccent;
  } else {
    return Colors.deepPurpleAccent;
  }
}

String getDesc(int aqi) {
  if (aqi <= 50) {
    return 'Цэвэр';
  } else if (aqi <= 100) {
    return 'Хэвийн';
  } else if (aqi <= 200) {
    return 'Бага Бохирдолтой';
  } else if (aqi <= 300) {
    return 'Бохирдолтой';
  } else if (aqi <= 400) {
    return 'Их Бохирдолтой';
  } else {
    return 'Маш Их Бохирдолтой';
  }
}



