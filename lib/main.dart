import 'package:amar_dokan_app/src/helpers/l10n/local_helper.dart';
import 'package:amar_dokan_app/src/helpers/l10n/local_provider.dart';
import 'package:amar_dokan_app/src/helpers/shared_preference_helper.dart';
import 'package:amar_dokan_app/src/views/navigation/side_navigation_screen.dart';
import 'package:amar_dokan_app/src/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/helpers/themes/themes.dart';
import 'src/helpers/themes/themes_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final themeModeState = ref.watch(themesProvider);
     final locale = ref.watch(localeProvider);
    return MaterialApp(
      title: 'AmarDokan App',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeModeState,
      locale: locale,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('bn', 'BD'),
        ],
        localizationsDelegates: [
          LocalizationHelper.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      debugShowCheckedModeBanner: false,
       home: SideNavigation()
    );
  }
}
