import 'package:amar_dokan_app/src/app.dart';
import 'package:amar_dokan_app/src/local/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();

  runApp(const ProviderScope(child: MyApp()));
}
