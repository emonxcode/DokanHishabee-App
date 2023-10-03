import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:amar_dokan_app/src/providers/side_navigation_provider.dart';
import 'package:amar_dokan_app/src/views/home.dart';
import 'package:amar_dokan_app/src/views/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../helpers/l10n/local_helper.dart';
import 'widgets/sideMenuButton.dart';

class SideNavigation extends ConsumerWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (context, s_ref, child) {
          var state = s_ref.watch(sideNavigationProvider);

          return Container(
            height: context.height,
            width: context.width,
            child: Row(
              children: [
                Expanded(
                  flex: 18,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black87,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppSpace.spaceH30,
                          AppSpace.spaceH10,
                          SideMenuButton(
                            menuColorValue: state.menuColorValue![0],
                            menuColorIndex: 0,
                            icon: Icons.shop_2_rounded,
                            label: LocalizationHelper.of(context)!.products!,
                            screen: ProductsScreen(),
                          ),
                          SideMenuButton(
                            menuColorValue: state.menuColorValue![1],
                            menuColorIndex: 1,
                            icon: Icons.shopping_cart,
                            label: LocalizationHelper.of(context)!.sale!,
                            screen: HomeScreen(),
                          ),
                          SideMenuButton(
                            menuColorValue: state.menuColorValue![2],
                            menuColorIndex: 2,
                            icon: Icons.stacked_bar_chart,
                            label: LocalizationHelper.of(context)!.report!,
                            screen: ProductsScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 85,
                  child: Container(
                    color: Colors.white,
                    child: state.sideView!,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
