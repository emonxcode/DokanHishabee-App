
import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/log/styles/styles.dart';
import '../providers/auth_provider.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({
    super.key,
    required this.mobileTextController,
  });

  final TextEditingController mobileTextController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var controller = ref.watch(authencationProvider);
        return Container(
          height: controller.mabileFieldError != null &&
                  controller.mabileFieldError!.isNotEmpty
              ? 70
              : 50,
          width: context.width * 0.8,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 2,
                color: AppColors.lightGrey
                   
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: theme == "light"
                ? AppColors.whiteColor
                : AppColors.darkGrey
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: mobileTextController,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Enter Mobile Number",
                  fillColor: AppColors.primaryColor,
                  focusColor: AppColors.primaryColor,
                  prefixIcon: Icon(Icons.mobile_screen_share),
                ),
              ),
              if (controller.mabileFieldError != null &&
                  controller.mabileFieldError! != "")
                Text(
                  controller.mabileFieldError!,
                  style: Styles.defaultStyle.copyWith(color: AppColors.redColor),
                ),
            ],
          ),
        );
      },
    );
  }
}
