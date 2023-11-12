
import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/products_provider.dart';
import '../../../utils/app_space.dart';
import '../../../utils/colors.dart';
import '../../widgets/dokan_hishabee_text.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key, required this.index, required this.product});

  final int index;
  final dynamic product;

  @override
  ConsumerState<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(productsProvider);

    return InkWell(
      onTap: () {
        controller.selectProduct(widget.index);
      },
      child: Stack(
        children: [
          Column(
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
                text: widget.product['name'],
                color: AppColors.darkColor.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.normal,
                maxLines: 2,
              ),
            ],
          ),
          Visibility(
            visible: controller.productList[widget.index]['isSelected'],
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: controller.productList[widget.index]['isSelected']
                    ? AppColors.primaryColor.withOpacity(0.2)
                    : null,
              ),
            ),
          ),
          Visibility(
            visible: controller.productList[widget.index]['isSelected'],
            child: Positioned(
              top: 5,
              right: 5,
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(width: 2, color: AppColors.whiteColor)),
                  child: const Icon(Icons.check)),
            ),
          ),
        ],
      ),
    );
  }
}
