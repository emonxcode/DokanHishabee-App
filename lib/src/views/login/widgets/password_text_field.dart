import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import '../../../helpers/styles/styles.dart';
import '../../../providers/auth_provider.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordTextController,
  });

  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(authencationProvider);
        var stateProvider = ref.read(authencationProvider.notifier);
        return Container(
          height: state is AuthenticationFormFieldErrorState &&
                  state.passFieldError.isNotEmpty
              ? 70
              : 50,
          width: context.width * 0.8,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 2,
                color: theme == "light"
                    ? Color.fromARGB(255, 236, 236, 233)
                    : Colors.black,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: theme == "light"
                ? Colors.white
                : Color.fromARGB(255, 92, 92, 92),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: passwordTextController,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(fontSize: 18),
                obscureText: !stateProvider.showPass,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    onPressed: () {
                      stateProvider.togglePasswordVisibility();
                    },
                    icon: Icon(stateProvider.showPass
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              ),
              if (state is AuthenticationFormFieldErrorState &&
                  state.passFieldError.isNotEmpty)
                Text(
                  state.passFieldError,
                  style: Styles.defaultStyle.copyWith(color: Colors.red),
                ),
            ],
          ),
        );
      },
    );
  }
}
