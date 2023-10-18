import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../../main.dart';
import '../../helpers/styles/styles.dart';
import '../../helpers/utils/app_space.dart';
import 'widgets/menu_items.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key, required this.dx, required this.dy});

  final double dx;
  final double dy;

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlideAnimatedWidget(
          direction: SlideDirectionType.fromOffset,
          duration: Duration(milliseconds: 300),
          offset: Offset(widget.dx, widget.dy),
          child: Container(
            height: context.height,
            width: context.width,
            child: Column(
              children: [
                AppSpace.spaceH10,
                Text(
                  "Options",
                  style: Styles.pagetitle.copyWith(
                    color: theme == "light" ? AppColors.darkColor : AppColors.whiteColor,
                  ),
                ),
                AppSpace.spaceH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/category.png',
                      label: 'Category',
                      routeID: "category",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/units.png',
                      label: 'Units',
                      routeID: "units",
                    ),
                  ],
                ),
                AppSpace.spaceH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/history.png',
                      label: 'Sales History',
                      routeID: "sh",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/due.png',
                      label: 'Due',
                      routeID: "due",
                    ),
                  ],
                ),
                AppSpace.spaceH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/supplier.png',
                      label: 'Suppliers',
                      routeID: "supp",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/customer.png',
                      label: 'Customers',
                      routeID: "cus",
                    ),
                  ],
                ),
                AppSpace.spaceH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/settings.png',
                      label: 'Settings',
                      routeID: "sett",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/account.png',
                      label: 'Account',
                      routeID: "acc",
                    ),
                  ],
                ),
                AppSpace.spaceH16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // OptionsItemView(
                    //   imgUrl: 'assets/image/settings.png',
                    //   label: 'Settings',
                    // ),
                    // AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/info.png',
                      label: 'About Us',
                      routeID: "ab",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
