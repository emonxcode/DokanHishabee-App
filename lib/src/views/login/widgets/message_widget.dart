import 'package:flutter/material.dart';

import '../../../helpers/styles/styles.dart';
import '../../../providers/auth_provider.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.state});

  var state;

  @override
  Widget build(BuildContext context) {
    if (state is AuthenticationLoadingState) {
      return Text(
        "Authenticating...",
        style: Styles.defaultStyle.copyWith(color: Colors.green),
      );
    }

    if (state is AuthenticationLoadedState) {
      return Text(
        state.message,
        style: Styles.defaultStyle.copyWith(color: Colors.green),
      );
    }

    if (state is AuthenticationErrorState) {
      return Text(
        state.message,
        style: Styles.defaultStyle.copyWith(color: Colors.red),
      );
    }
    return SizedBox();
  }
}
