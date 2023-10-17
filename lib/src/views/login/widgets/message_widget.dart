import 'package:amar_dokan_app/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/styles/styles.dart';

class MessageWidget extends ConsumerWidget {
  MessageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(authencationProvider);
    Color color = Colors.green;
    if (controller.isErrorMessage) {
      color = Colors.red;
    } else {
      color = Colors.green;
    }

    return Text(
      controller.isLoading ? "Loading..." : controller.message,
      style: Styles.defaultStyle.copyWith(color: color),
    );
  }
}
