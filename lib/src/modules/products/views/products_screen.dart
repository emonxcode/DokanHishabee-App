import 'package:amar_dokan_app/src/local/shared_preference_helper.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:amar_dokan_app/src/modules/products/controller/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import '../../../utils/app_space.dart';
import '../../../utils/colors.dart';
import '../../widgets/dokan_hishabee_text.dart';
import 'components/app_bar.dart';
import 'components/category_list.dart';
import 'components/end_drawer.dart';
import 'components/product_list.dart';
import 'components/scanner_btn.dart';
import 'components/search_bar.dart';

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
      backgroundColor: AppColors.whiteColor,
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
                InkWell(
                    onTap: () {
                      LocalData.setLoginFlag(false);
                    },
                    child: ProductPageAppBar(scaffolldKey: scaffolldKey)),
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
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                AppSpace.spaceH4,
                const CategoryListView(),
                AppSpace.spaceH10,
                const DokanHishabeeTextWidget(
                  text: "Select Products",
                  color: AppColors.darkGrey,
                  fontSize: 16,
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
