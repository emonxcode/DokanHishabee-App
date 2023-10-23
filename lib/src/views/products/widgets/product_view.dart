import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:flutter/material.dart';

import '../../../helpers/utils/colors.dart';
import '../../../providers/products_provider.dart';
import '../../widgets/dokan_hishabee_text.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.controller, required this.index});

  final ProductsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lightGrey,
            ),
            child: Container(
              height: context.height * 0.14 - 30,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/cart.jpg"),
              ),
            ),
          ),
          AppSpace.spaceH4,
          DokanHishabeeTextWidget(
            text: "Pepsi 250ml",
            color: AppColors.darkColor.withOpacity(0.5),
            fontSize: 15,
            fontWeight: FontWeight.normal,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
