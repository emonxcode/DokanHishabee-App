import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:amar_dokan_app/src/views/category/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import '../../../helpers/styles/styles.dart';
import '../../../helpers/utils/app_space.dart';
import '../../../providers/side_navigation_provider.dart';
import '../../units/units_screen.dart';

class OptionsItemView extends ConsumerWidget {
  const OptionsItemView({
    super.key,
    required this.routeID,
    required this.imgUrl,
    required this.label,
  });

  final String imgUrl;
  final String label;
  final String routeID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (routeID == "category") {
          ref
              .read(sideNavigationProvider.notifier)
              .changeSideView(CategoryScreen());
          ref.read(sideNavigationProvider.notifier).setColorValue(6);
        } else if (routeID == "units") {
          ref
              .read(sideNavigationProvider.notifier)
              .changeSideView(UnitsScreen());
          ref.read(sideNavigationProvider.notifier).setColorValue(6);
        }
      },
      child: Container(
        height: 100,
        width: context.width * 0.35,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: theme == "light"
                      ? AppColors.lightGrey
                      : Theme.of(context).scaffoldBackgroundColor)
            ],
            borderRadius: BorderRadius.circular(15),
            color:
                theme == "light" ? AppColors.whiteColor : AppColors.darkGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(imgUrl),
            ),
            AppSpace.spaceH10,
            Text(
              label,
              style: Styles.h1.copyWith(
                color: theme == "light"
                    ? Colors.black54
                    : Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
