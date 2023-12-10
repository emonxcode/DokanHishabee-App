import 'package:flutter/material.dart';

import '../../../widgets/dokan_hishabee_text.dart';

class DataCardView extends StatelessWidget {
  const DataCardView({
    super.key,
    required this.label,
    required this.value,
    required this.bgColor,
    required this.valueColor,
  });

  final label;
  final value;
  final bgColor;
  final valueColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DokanHishabeeTextWidget(
              text: value + " Tk",
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            DokanHishabeeTextWidget(
              text: label.toString(),
              color: Colors.green,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
