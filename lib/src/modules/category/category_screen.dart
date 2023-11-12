
import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../utils/app_space.dart';
import '../global_widgets/menu_page_app_bar.dart';
import 'widgets/top_container.dart';


class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            child: const Column(
              children:  [
               CustomMenuAppBar(
                  logoUrl: 'assets/images/category.png',
                  title: "Categories",
                ),
                AppSpace.spaceH10,
                TopCardAddCategory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
