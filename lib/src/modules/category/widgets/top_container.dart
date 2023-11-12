import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_space.dart';
import 'category_image_picker_container.dart';
import 'category_name_field.dart';
import 'category_save_btn.dart';

class TopCardAddCategory extends StatelessWidget {
  const TopCardAddCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          offset: Offset(0, 0),
          blurRadius: 2,
          spreadRadius: 2,
          color: AppColors.lightGrey,
        ),
      ], borderRadius: BorderRadius.circular(15), color: AppColors.whiteColor),
      child: const Column(
        children: [
          AppSpace.spaceH10,
          ImagePickerContainer(),
          AppSpace.spaceH10,
          CategoryNameField(),
          AppSpace.spaceH20,
          CategorySaveButton(),
        ],
      ),
    );
  }
}
