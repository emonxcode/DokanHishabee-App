import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import '../../utils/app_space.dart';
import '../../utils/colors.dart';
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
          duration: const Duration(milliseconds: 300),
          offset: Offset(widget.dx, widget.dy),
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: const Column(
              children: [
                AppSpace.spaceH10,
                DokanHishabeeTextWidget(
                  text: "Options",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
                AppSpace.spaceH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionsItemView(
                      imgUrl: 'assets/images/category.png',
                      label: 'Category',
                      routeID: "category",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/images/units.png',
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
                      imgUrl: 'assets/images/history.png',
                      label: 'Sales History',
                      routeID: "sh",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/images/due.png',
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
                      imgUrl: 'assets/images/supplier.png',
                      label: 'Suppliers',
                      routeID: "supp",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/images/customer.png',
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
                      imgUrl: 'assets/images/settings.png',
                      label: 'Settings',
                      routeID: "sett",
                    ),
                    AppSpace.spaceW16,
                    OptionsItemView(
                      imgUrl: 'assets/images/account.png',
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
                      imgUrl: 'assets/images/info.png',
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
