import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/dokan_hishabee_text.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DokanHishabeeTextWidget(
              text: "Bismillah General Store",
              color: AppColors.darkColor,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            DokanHishabeeTextWidget(
              text:
                  "All Products - ${DateFormat('dd MMMM yyy').format(DateTime.now())}",
              color: AppColors.darkGrey,
              fontSize: 15,
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
