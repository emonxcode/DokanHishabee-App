import 'package:amar_dokan_app/src/modules/units/providers/unit_provider.dart';
import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../../utils/app_space.dart';
import '../../global_widgets/menu_page_app_bar.dart';
import 'widgets/unit_name_field.dart';
import 'widgets/unit_save_btn.dart';

class UnitsScreen extends ConsumerStatefulWidget {
  const UnitsScreen({super.key});

  @override
  ConsumerState<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends ConsumerState<UnitsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) =>
        ref.read(unitProvider.notifier).getAllUnits(context: context));
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(unitProvider.notifier);
    ref.watch(unitProvider);
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: const Duration(milliseconds: 300),
        offset: Offset(context.height * 0.5, 0),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const CustomMenuAppBar(
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
                      color: Colors.white),
                  child: Column(
                    children: [
                      AppSpace.spaceH10,
                      UnitNameField(
                        unitNameController: controller.unitNameTextController,
                      ),
                      AppSpace.spaceH20,
                      UnitSaveButton(
                        isLoading: controller.isBtnLoading,
                        onTap: () {
                          controller.createUnit(context: context);
                        },
                      ),
                    ],
                  ),
                ),
                AppSpace.spaceH10,
                Flexible(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.units.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightGrey,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: Image.asset("assets/images/unit.png"),
                          ),
                          AppSpace.spaceW10,
                          DokanHishabeeTextWidget(
                            text: controller.units[index].name ?? "s",
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
