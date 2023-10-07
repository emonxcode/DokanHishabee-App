import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:amar_dokan_app/src/views/global_widgets/menu_page_app_bar.dart';
import 'package:amar_dokan_app/src/views/category/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';


class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: Duration(milliseconds: 300),
        offset: Offset(context.height * 0.5, 0),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
               CustomMenuAppBar(
                  logoUrl: 'assets/image/category.png',
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
