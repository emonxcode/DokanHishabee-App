import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:flutter/material.dart';

class DokanHishabeeTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  const DokanHishabeeTextWidget(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.left,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign ??
          TextAlign
              .start, // I used ellipsis, but it works with others (fade, clip, etc.)

      maxLines: maxLines ?? 1,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 18,
        color: color ?? AppColors.primaryColor,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        decoration: textDecoration,
        fontFamily: "Ador",
      ),
    );
  }
}
