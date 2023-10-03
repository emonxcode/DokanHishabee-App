import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../helpers/constants/enums.dart';
import '../helpers/l10n/local_helper.dart';
import '../helpers/l10n/local_provider.dart';
import '../helpers/themes/themes_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
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
            PopupMenuButton<SupportedLocale>(
              itemBuilder: (context) {
                return SupportedLocale.values
                    .map<PopupMenuEntry<SupportedLocale>>((e) => PopupMenuItem(
                          child: Text('${e.name}'),
                          value: e,
                        ))
                    .toList();
              },
              onSelected: (locale) {
                ref.read(localeProvider.notifier).changeLanguage(locale);
              },
            ),
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
    );
  }
}
