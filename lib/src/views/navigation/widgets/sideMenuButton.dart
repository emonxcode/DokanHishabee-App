import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/styles/styles.dart';
import '../../../providers/side_navigation_provider.dart';

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
        ref.read(sideNavigationProvider.notifier).changeSideView(screen);
        ref.read(sideNavigationProvider.notifier).setColorValue(menuColorIndex);
      },
      child: Container(
        height: context.height * .115,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: menuColorValue == 0
                  ? Colors.white
                  : Color.fromARGB(255, 0, 255, 42),
            ),
            Text(
              label,
              style: Styles.sideMenuLabel.copyWith(
                color: menuColorValue == 0
                    ? Colors.white
                    : Color.fromARGB(255, 0, 255, 42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
