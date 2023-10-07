import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:amar_dokan_app/src/views/category/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../../main.dart';
import 'widgets/category_image_picker_container.dart';
import 'widgets/category_name_field.dart';
import 'widgets/category_save_btn.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: Duration(milliseconds: 300),
        offset: Offset(context.height * 0.5, 0),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CustomAppBar(),
                AppSpace.spaceH10,
                TopCardAddCategory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
        color:
            theme == "light" ? Colors.white : Color.fromARGB(255, 92, 92, 92),
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
