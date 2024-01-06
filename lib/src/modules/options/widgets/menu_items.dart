import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../main.dart';
import '../../../utils/app_space.dart';
import '../../../utils/colors.dart';
import '../../navigation/providers/side_navigation_provider.dart';
import '../../category/category_screen.dart';
import '../../units/views/units_screen.dart';

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
              .changeSideView(const CategoryScreen());
          ref.read(sideNavigationProvider.notifier).setColorValue(6);
        } else if (routeID == "units") {
          ref
              .read(sideNavigationProvider.notifier)
              .changeSideView(const UnitsScreen());
          ref.read(sideNavigationProvider.notifier).setColorValue(6);
        }
      },
      child: Container(
        height: 100,
        width: context.width * 0.35,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset:  Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color:AppColors.lightGrey)
            ],
            borderRadius: BorderRadius.circular(15),
            color:
               AppColors.whiteColor,),
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
              // style: Styles.h1.copyWith(
              //     color: theme == "light"
              //         ? AppColors.darkColor
              //         : AppColors.lightGrey),
            ),
          ],
        ),
      ),
    );
  }
}
