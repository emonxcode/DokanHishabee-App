import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../helpers/shared_preference_helper.dart';

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
              offset: Offset(0, 0),
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
        child: Center(
          child: Icon(Icons.document_scanner),
        ),
      ),
    );
  }
}
