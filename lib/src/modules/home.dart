import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import '../constants/enums.dart';
import '../l10n/local_helper.dart';
import '../l10n/local_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: const Duration(milliseconds: 300),
        offset: Offset(0, context.height * 0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton<SupportedLocale>(
                itemBuilder: (context) {
                  return SupportedLocale.values
                      .map<PopupMenuEntry<SupportedLocale>>(
                        (e) => PopupMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList();
                },
                onSelected: (locale) {
                  ref.read(localeProvider.notifier).changeLanguage(locale);
                },
              ),
              Text('${LocalizationHelper.of(context)!.products}',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall),
             
           
            ],
          ),
        ),
      ),
    );
  }
}
