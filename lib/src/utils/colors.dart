import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromARGB(255, 0, 202, 34);
  static const lightGrey = Color.fromARGB(255, 236, 236, 233);
  static const grey = Colors.grey;
  static const darkGrey = Color.fromARGB(255, 105, 105, 105);
  static const whiteColor = Colors.white;
  static const darkColor = Colors.black87;
  static const redColor = Colors.red;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}