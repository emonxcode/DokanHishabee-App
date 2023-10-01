import 'package:flutter/material.dart';

class Styles {
  static TextStyle defaultStyle = TextStyle(color: Colors.blue);

  static TextStyle h1 = defaultStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
  );

  static TextStyle p =
      defaultStyle.copyWith(fontSize: 16.0, color: Colors.black);

  static TextStyle error = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.red,
  );

  static InputDecoration input = InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.grey[900],
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      gapPadding: 1.0,
      borderSide: BorderSide(
        color: Colors.grey[600]!,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey[600],
    ),
  );
}
