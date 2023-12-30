import 'package:amar_dokan_app/src/modules/category/providers/category_provider.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/app_space.dart';
import '../../widgets/file_picker_bottom_sheet.dart';
import 'category_image_picker_container.dart';
import 'category_name_field.dart';
import 'category_save_btn.dart';

class TopCardAddCategory extends ConsumerWidget {
  const TopCardAddCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(categoryProvider);
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
      child: Column(
        children: [
          AppSpace.spaceH10,
          InkWell(
            onTap: () async {
              var file = await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FilePicker();
                },
              );
              controller.setImageFile(file);
            },
            child: controller.imageFile == null
                ? const ImagePickerContainer()
                : Container(
                    height: 120,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.file(
                      controller.imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          AppSpace.spaceH10,
          CategoryNameField(
              categoryNameController: controller.categoryNameTextController),
          AppSpace.spaceH20,
          CategorySaveButton(
            isLoading: controller.isBtnLoading,
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.createCategory(context: context);
            },
          ),
        ],
      ),
    );
  }
}
