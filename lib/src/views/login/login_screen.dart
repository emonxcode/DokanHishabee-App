import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../helpers/styles/styles.dart';
import '../../helpers/utils/app_space.dart';
import 'widgets/message_widget.dart';
import 'widgets/mobile_text_field.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var mobileTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return Container(
            height: context.height,
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/logo/app_logo_round.png",
                  ),
                ),
                AppSpace.spaceH10,
                Text(
                  "Dokan Hishabee - দোকান হিসাবী",
                  style: Styles.pagetitle.copyWith(
                    fontSize: 15,
                    color: theme == "dark"
                        ? Color.fromARGB(255, 219, 219, 219)
                        : const Color.fromARGB(255, 73, 73, 73),
                  ),
                ),
                AppSpace.spaceH10,
                Consumer(
                  builder: (context, ref, child) {
                    var state = ref.watch(authencationProvider);
                    return MessageWidget(state: state);
                  },
                ),
                AppSpace.spaceH10,
                MobileTextField(mobileTextController: mobileTextController),
                AppSpace.spaceH18,
                PasswordTextField(
                    passwordTextController: passwordTextController),
                AppSpace.spaceH20,
                SizedBox(
                  height: 50,
                  width: context.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme == "light"
                          ? Colors.green
                          : Color.fromARGB(255, 236, 236, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      await ref.read(authencationProvider.notifier).login(
                          mobileTextController.text,
                          passwordTextController.text,
                          context);
                    },
                    child: Text(
                      "LOGIN",
                      style: Styles.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme == "dark"
                            ? Colors.green
                            : Color.fromARGB(255, 236, 236, 233),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
