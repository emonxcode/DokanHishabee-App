import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../main.dart';
import '../navigation/providers/side_navigation_provider.dart';
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
        DokanHishabeeTextWidget(
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.darkGrey,
        ),
        IconButton(
          onPressed: () {
            ref
                .read(sideNavigationProvider.notifier)
                .changeSideView(const OptionsScreen(dx: 0, dy: 0));
            ref.read(sideNavigationProvider.notifier).setColorValue(6);
          },
          // color: theme == "light" ? Colors.black87 : Colors.white,
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.cancel,
            size: 35,
          ),
        ),
      ],
    );
  }
}
