import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants/enums.dart';
import '../helpers/l10n/local_helper.dart';
import '../helpers/l10n/local_provider.dart';
import '../helpers/themes/themes_provider.dart';

class HomeScreenTwo extends ConsumerWidget {
  const HomeScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.read(themesProvider);
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${LocalizationHelper.of(context)!.description}',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline5),
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
    );
  }
}
