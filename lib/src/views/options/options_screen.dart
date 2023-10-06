import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../../main.dart';
import '../../helpers/styles/styles.dart';
import '../../helpers/utils/app_space.dart';
import 'widgets/menu_items.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

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
          offset: Offset(0, context.height * 0.5),
          child: Container(
            height: context.height,
            width: context.width,
            child: Column(
              children: [
                AppSpace.spaceH10,
                Text(
                  "Options",
                  style: Styles.pagetitle.copyWith(
                    color: theme == "light" ? Colors.black87 : Colors.white,
                  ),
                ),
                AppSpace.spaceH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/category.png',
                      label: 'Category',
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/units.png',
                      label: 'Units',
                    ),
                  ],
                ),
                AppSpace.spaceH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/history.png',
                      label: 'Sales History',
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/due.png',
                      label: 'Due',
                    ),
                  ],
                ),
                AppSpace.spaceH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/supplier.png',
                      label: 'Suppliers',
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/customer.png',
                      label: 'Customers',
                    ),
                  ],
                ),
                AppSpace.spaceH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/image/settings.png',
                      label: 'Settings',
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/image/account.png',
                      label: 'Account',
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
