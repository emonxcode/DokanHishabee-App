import 'package:flutter/material.dart';

import '../../../helpers/styles/styles.dart';
import '../../../providers/auth_provider.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.state});

  var state;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.green;
    if (state is AuthenticationLoadingState) {
      color = Colors.green;
    }

    if (state is AuthenticationLoadedState) {
      color = Colors.green;
    }

    if (state is AuthenticationErrorState) {
      color = Colors.red;
    }

    if (state is AuthenticationFormFieldErrorState) {
      color = Colors.red;
    }
    return Text(
      state.message,
      style: Styles.defaultStyle.copyWith(color: color),
    );
  }
}
