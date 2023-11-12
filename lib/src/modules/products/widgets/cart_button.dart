import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../../utils/colors.dart';
import '../../widgets/dokan_hishabee_text.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.onTap,
    required this.value,
  });

  final Function onTap;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topLeft,
      largeSize: 23,
      backgroundColor: AppColors.primaryColor,
      label: DokanHishabeeTextWidget(
        text: value.toString(),
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
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
          child: const Center(
            child: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
