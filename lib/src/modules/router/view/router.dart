import 'package:amar_dokan_app/src/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart' show BuildContext, Key, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;


class AppRouter extends ConsumerWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SplashScreen();
  }
}
