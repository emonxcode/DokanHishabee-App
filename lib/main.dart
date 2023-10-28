import 'package:amar_dokan_app/src/helpers/l10n/local_helper.dart';
import 'package:amar_dokan_app/src/helpers/l10n/local_provider.dart';
import 'package:amar_dokan_app/src/helpers/shared_preference_helper.dart';
import 'package:amar_dokan_app/src/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/helpers/themes/themes.dart';
import 'src/helpers/themes/themes_provider.dart';

String theme = "light";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  theme = await SharedPreferencesHelper.getTheme();
  runApp(const ProviderScope(child: MyApp()));
} 

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    final locale = ref.watch(localeProvider);
    return MaterialApp(
      title: 'DokanHishabee - দোকান হিসাবী',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeModeState,
      locale: locale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('bn', 'BD'), 
      ],
      localizationsDelegates: const [
        LocalizationHelper.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
