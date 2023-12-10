import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../controller/products_provider.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/dokan_hishabee_text.dart';

class CategoryView extends StatelessWidget {
  const CategoryView(
      {super.key, required this.controller, required this.index});

  final ProductsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectCategory(index);
      },
      child: Container(
        height: context.height * 0.12,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppColors.lightGrey,
          border: controller.selectedCategory != index
              ? null
              : Border.all(width: 6, color: AppColors.primaryColor),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: context.height * 0.12 - 30,
                width: 120,
                // padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset("assets/images/cat.png"),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                width: 120,
                decoration: const BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: DokanHishabeeTextWidget(
                    text: controller.categoryList[index],
                    color: AppColors.whiteColor.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
