import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import '../helpers/l10n/local_helper.dart';
import '../helpers/themes/themes_provider.dart';

class HomeScreenTwo extends ConsumerWidget {
  const HomeScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.read(themesProvider);
    
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: Duration(milliseconds: 300),
        offset: Offset(0, context.height * 0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${LocalizationHelper.of(context)!.description}',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(
                "Change Theme $themeModeState",
                style: const TextStyle(fontSize: 18),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return Switch(
                      value: themeModeState == ThemeMode.dark, //false or true
                      onChanged: (value) {
                        ref.read(themesProvider.notifier).changeTheme(value);
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
