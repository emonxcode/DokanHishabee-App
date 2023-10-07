import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import '../../../helpers/styles/styles.dart';
import '../../../providers/side_navigation_provider.dart';
import '../../options/options_screen.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Image.asset('assets/image/category.png'),
        ),
        Text(
          "Categories",
          style: Styles.pagetitle.copyWith(
            color: theme == "light" ? Colors.black87 : Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(sideNavigationProvider.notifier).changeSideView(
                OptionsScreen(dx: -context.height * 0.5, dy: 0));
            ref.read(sideNavigationProvider.notifier).setColorValue(6);
          },
          color: theme == "light" ? Colors.black87 : Colors.white,
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.cancel,
            size: 35,
          ),
        ),
      ],
    );
  }
}
