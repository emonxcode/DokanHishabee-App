import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:amar_dokan_app/src/providers/products_provider.dart';
import 'package:amar_dokan_app/src/views/widgets/dokan_hishabee_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import '../../../main.dart';
import 'widgets/category_list.dart';
import 'widgets/product_list.dart';
import 'widgets/product_view.dart';
import 'widgets/scanner_btn.dart';
import 'widgets/search_bar.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(productsProvider);
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: Duration(milliseconds: 300),
        offset: Offset(0, context.height * 0.5),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpace.spaceH4,
                DokanHishabeeTextWidget(
                  text: "Bismillah General Store",
                  color: theme == "light"
                      ? AppColors.darkColor
                      : AppColors.whiteColor,
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
                AppSpace.spaceH18,
                Row(
                  children: [
                    ProductSearchBar(),
                    Spacer(),
                    ScannerButton(),
                  ],
                ),
                AppSpace.spaceH10,
                DokanHishabeeTextWidget(
                  text: "Categories",
                  color: AppColors.darkGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                AppSpace.spaceH4,
                CategoryListView(),
                AppSpace.spaceH10,
                DokanHishabeeTextWidget(
                  text: "Select Products",
                  color: AppColors.darkGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                AppSpace.spaceH10,
                ProductList(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

