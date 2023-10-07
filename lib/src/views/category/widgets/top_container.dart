import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../helpers/utils/app_space.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 2,
            color: theme == "light"
                ? Color.fromARGB(255, 236, 236, 233)
                : Color.fromARGB(255, 27, 27, 27),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: theme == "light" ? Colors.white : Color.fromARGB(255, 92, 92, 92),
      ),
      child: Column(
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
