import 'package:amar_dokan_app/src/app.dart';
import 'package:amar_dokan_app/src/l10n/local_helper.dart';
import 'package:amar_dokan_app/src/l10n/local_provider.dart';
import 'package:amar_dokan_app/src/helpers/shared_preference_helper.dart';
import 'package:amar_dokan_app/src/modules/splash_screen/splash_screen.dart';
import 'package:amar_dokan_app/src/theme/provider/theme.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/db/isar.dart';

String theme = "light";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await openDB();
  theme = await SharedPreferencesHelper.getTheme();
  runApp(const ProviderScope(child: MyApp()));
} 
