import 'dart:ui';

import 'package:amar_dokan_app/src/helpers/l10n/local_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/enums.dart';
import 'local_pref.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(Locale('en')) {
    onAppStart();
  }

  void changeLanguage(SupportedLocale locale) {
    try {
      AppSharedPreference.saveLocale(locale);
      state = Locale(locale.code);
    } catch (error) {
      state = Locale('en');
    }
  }

  void onAppStart() {
    try {
      final locale = AppSharedPreference.getLocale();
      state = locale;
    } catch (error) {
      state = Locale('en');
    }
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
