import 'package:amar_dokan_app/src/modules/report/views/reports_screen.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:amar_dokan_app/src/modules/navigation/providers/side_navigation_provider.dart';
import 'package:amar_dokan_app/src/modules/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/local_helper.dart';
import '../../utils/app_space.dart';
import '../../utils/colors.dart';
import '../options/options_screen.dart';
import '../products/views/products_screen.dart';
import 'widgets/sideMenuButton.dart';

class SideNavigation extends ConsumerWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(sideNavigationProvider);

    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Row(
          children: [
            Expanded(
              flex: 18,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: AppColors.darkColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppSpace.spaceH30,
                      SideMenuButton(
                        menuColorValue: controller.menuColorValue![0],
                        menuColorIndex: 0,
                        icon: Icons.store,
                        label: LocalizationHelper.of(context)!.products!,
                        screen: const ProductsScreen(),
                      ),
                      SideMenuButton(
                        menuColorValue: controller.menuColorValue![2],
                        menuColorIndex: 2,
                        icon: Icons.stacked_bar_chart,
                        label: LocalizationHelper.of(context)!.report!,
                        screen: const ReportsScreen(),
                      ),
                      SideMenuButton(
                        menuColorValue: controller.menuColorValue![3],
                        menuColorIndex: 3,
                        icon: Icons.add_chart,
                        label: LocalizationHelper.of(context)!.stock!,
                        screen: const ProductsScreen(),
                      ),
                      SideMenuButton(
                        menuColorValue: controller.menuColorValue![4],
                        menuColorIndex: 4,
                        icon: Icons.handshake_rounded,
                        label: LocalizationHelper.of(context)!.purchase!,
                        screen: const ProductsScreen(),
                      ),
                      SideMenuButton(
                        menuColorValue: controller.menuColorValue![5],
                        menuColorIndex: 5,
                        icon: Icons.arrow_circle_down_sharp,
                        label: LocalizationHelper.of(context)!.expense!,
                        screen: const ProductsScreen(),
                      ),
                      SideMenuButton(
                        menuColorValue: controller.menuColorValue![6],
                        menuColorIndex: 6,
                        icon: Icons.grid_view_rounded,
                        label: LocalizationHelper.of(context)!.menu!,
                        screen: OptionsScreen(dx: 0, dy: context.height * 0.5),
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
                child: controller.sideView!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
