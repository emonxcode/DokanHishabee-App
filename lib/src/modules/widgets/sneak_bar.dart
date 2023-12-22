import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

class DokanSneakBar {
  static void customSnackBar(
      {required context,
      required String snackText,
      SnackBarBehavior? snackBehavior,
      SnackBarAction? snackBarAction,
      double? snackTextSize,
      Color? snackTextColor,
      int? snackDuration,
      Color? snackBackgroundColor}) {
    final snack = SnackBar(
      backgroundColor: snackBackgroundColor ?? AppColors.blackColor,
      behavior: snackBehavior ?? SnackBarBehavior.fixed,
      elevation: 0,
      action: snackBarAction,
      content: DokanHishabeeTextWidget(
          color: snackTextColor ?? AppColors.whiteColor,
          fontSize: snackTextSize ?? 14,
          maxLines: 4,
          text: snackText),
      duration: Duration(seconds: snackDuration ?? 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
