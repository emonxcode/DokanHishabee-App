import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../local/shared_preference_helper.dart';
import '../../../../utils/colors.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await LocalData.setLoginFlag(false);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: AppColors.lightGrey),
            ],
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor),
        child: const Center(
          child: Icon(Icons.document_scanner),
        ),
      ),
    );
  }
}
