import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';
import '../../../helpers/utils/colors.dart';
import '../../widgets/dokan_hishabee_text.dart';
import 'cart_button.dart';

class ProductPageAppBar extends StatelessWidget {
  const ProductPageAppBar({
    super.key,
    required this.scaffolldKey,
  });

  final GlobalKey<ScaffoldState> scaffolldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            DokanHishabeeTextWidget( 
              text: "Bismillah General Store",
              color:
                  theme == "light" ? AppColors.darkColor : AppColors.whiteColor,
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
            DokanHishabeeTextWidget(
              text:
                  "All Products - ${DateFormat('dd MMMM yyy').format(DateTime.now())}",
              color: AppColors.darkGrey,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
        const Spacer(),
        CartButton(
          onTap: () {
            scaffolldKey.currentState!.openEndDrawer();
          },
          value: "2",
        ),
      ],
    );
  }
}
