import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart'
    show Brightness, BuildContext, Colors, Key, Locale, MaterialApp, ThemeData, Widget;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../src/constants/constants.dart' show appName;
import 'l10n/local_helper.dart';
import 'modules/router/view/router.dart' show AppRouter;

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'DokanHishabee - দোকান হিসাবী',
      localizationsDelegates: const [
        LocalizationHelper.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('bn', 'BD'),
      ],
      theme: 
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      restorationScopeId: appName,
      home: const AppRouter(),
    );
  }
}

