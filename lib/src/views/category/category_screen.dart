import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/styles/styles.dart';
import 'package:amar_dokan_app/src/views/options/options_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../../main.dart';
import '../../providers/side_navigation_provider.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      "Categories",
                      style: Styles.pagetitle.copyWith(
                        color: theme == "light" ? Colors.black87 : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(sideNavigationProvider.notifier)
                            .changeSideView(OptionsScreen(
                                dx: -context.height * 0.5, dy: 0));
                        ref
                            .read(sideNavigationProvider.notifier)
                            .setColorValue(6);
                      },
                      color: theme == "light" ? Colors.black87 : Colors.white,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.cancel,
                        size: 40,
                      ),
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
