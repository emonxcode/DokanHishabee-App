import 'package:amar_dokan_app/src/helpers/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>((_) {
  return ThemesProvider();
});

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider() : super(ThemeMode.system) {
    initTheme();
  }

  void changeTheme(bool isOn) async {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
    await SharedPreferencesHelper.setTheme(isOn ? "dark" : "light");
  }

  void initTheme() async {
    var theme = await SharedPreferencesHelper.getTheme();
    print(theme);
    state = theme == ThemeMode.dark.name ? ThemeMode.dark : ThemeMode.light;
  }
}
