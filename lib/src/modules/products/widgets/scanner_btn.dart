
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../helpers/shared_preference_helper.dart';
import '../../../utils/colors.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await SharedPreferencesHelper.setLoginFlag(false);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 2,
              color: theme == "light"
                  ? AppColors.lightGrey
                  : Theme.of(context).scaffoldBackgroundColor,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: theme == "light" ? AppColors.whiteColor : AppColors.darkGrey,
        ),
        child: const Center(
          child: Icon(Icons.document_scanner),
        ),
      ),
    );
  }
}
