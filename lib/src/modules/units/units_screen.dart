
import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:amar_dokan_app/src/modules/units/widgets/unit_name_field.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../../main.dart';
import '../../utils/app_space.dart';
import '../global_widgets/menu_page_app_bar.dart';
import 'widgets/unit_save_btn.dart';

class UnitsScreen extends ConsumerWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: const Duration(milliseconds: 300),
        offset:  Offset(context.height * 0.5, 0),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
              const  CustomMenuAppBar(
                  logoUrl: 'assets/images/units.png',
                  title: "Units",
                ),
                AppSpace.spaceH10,
                Container(
                  height: 120,
                  width: context.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: AppColors.lightGrey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color:  Colors.white
                  ),
                  child: const Column(
                    children: [
                      AppSpace.spaceH10,
                      UnitNameField(),
                      AppSpace.spaceH20,
                      UnitSaveButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
