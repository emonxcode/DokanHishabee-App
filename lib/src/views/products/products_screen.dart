import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:amar_dokan_app/src/providers/products_provider.dart';
import 'package:amar_dokan_app/src/views/widgets/dokan_hishabee_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'widgets/app_bar.dart';
import 'widgets/category_list.dart';
import 'widgets/end_drawer.dart';
import 'widgets/product_list.dart';
import 'widgets/scanner_btn.dart';
import 'widgets/search_bar.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  GlobalKey<ScaffoldState> scaffolldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(productsProvider);

    return Scaffold(
      key: scaffolldKey,
      endDrawer: Container(
        height: context.height * 0.8,
        width: context.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.whiteColor,
        ),
        child: const EndDrawerWidget(),
      ),
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: const Duration(milliseconds: 300),
        offset: Offset(0, context.height * 0.5),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpace.spaceH4,
                ProductPageAppBar(scaffolldKey: scaffolldKey),
                AppSpace.spaceH18,
                const Row(
                  children: [
                    ProductSearchBar(),
                    Spacer(),
                    ScannerButton(),
                  ],
                ),
                AppSpace.spaceH10,
                const DokanHishabeeTextWidget(
                  text: "Categories",
                  color: AppColors.darkGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                AppSpace.spaceH4,
                const CategoryListView(),
                AppSpace.spaceH10,
                const DokanHishabeeTextWidget(
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
