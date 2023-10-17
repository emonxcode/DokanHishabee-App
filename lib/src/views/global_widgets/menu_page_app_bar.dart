import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../helpers/styles/styles.dart';
import '../../providers/side_navigation_provider.dart';
import '../options/options_screen.dart';

class CustomMenuAppBar extends ConsumerWidget {
  const CustomMenuAppBar(
      {super.key, required this.logoUrl, required this.title});

  final String logoUrl;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(logoUrl),
        ),
        Text(
          title,
          style: Styles.pagetitle.copyWith(
            color: theme == "light" ? Colors.black87 : Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(sideNavigationProvider.notifier)
                .changeSideView(OptionsScreen(dx: 0, dy: 0));
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
