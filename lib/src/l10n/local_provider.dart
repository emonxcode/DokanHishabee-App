import 'dart:ui';
import 'package:amar_dokan_app/src/l10n/local_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/enums.dart';
import '../local/shared_preference_helper.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(Locale('en')) {
    onAppStart();
  }

  void changeLanguage(SupportedLocale locale) {
    try {
      LocalData.saveLocale(locale);
      state = Locale(locale.code);
    } catch (error) {
      state = Locale('en');
    }
  }

  void onAppStart() {
    try {
      final locale = LocalData.getLocale();
      state = locale;
    } catch (error) {
      state = Locale('en');
    }
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
