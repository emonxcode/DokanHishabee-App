
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/side_navigation_provider.dart';
import '../../../utils/colors.dart';
import '../../widgets/dokan_hishabee_text.dart';

class SideMenuButton extends ConsumerWidget {
  const SideMenuButton({
    super.key,
    required this.menuColorValue,
    required this.menuColorIndex,
    required this.icon,
    required this.label,
    required this.screen,
  });

  final int menuColorValue;
  final int menuColorIndex;
  final IconData icon;
  final String label;
  final Widget screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(sideNavigationProvider).changeSideView(screen);
        ref.read(sideNavigationProvider).setColorValue(menuColorIndex);
      },
      child: SizedBox(
        height: context.height * .115,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,
                size: 30,
                color: menuColorValue == 0
                    ? AppColors.whiteColor
                    : AppColors.primaryColor),
            DokanHishabeeTextWidget(
              text: label,
              color: menuColorValue == 0
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
