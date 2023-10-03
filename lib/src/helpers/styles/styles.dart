import 'package:amar_dokan_app/src/helpers/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle defaultStyle = TextStyle(color: SharedPreferencesHelper.getTheme() == "light" ? Colors.black87 : Colors.white);

  static TextStyle sideMenuLabel = defaultStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );

  static TextStyle pagetitle = defaultStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
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
