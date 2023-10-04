import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../helpers/styles/styles.dart';
import '../../helpers/utils/app_space.dart';
import 'widgets/message_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var mobileTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(authencationProvider);
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
              MessageWidget(state: state),
              AppSpace.spaceH10,
              Container(
                height: 50,
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
                child: TextField(
                  controller: mobileTextController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Enter Mobile Number",
                    fillColor: Colors.green,
                    focusColor: Colors.green,
                    prefixIcon: Icon(Icons.mobile_screen_share),
                  ),
                ),
              ),
              AppSpace.spaceH18,
              Container(
                height: 50,
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
                child: TextField(
                  controller: passwordTextController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 18),
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.security),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility),
                    ),
                  ),
                ),
              ),
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
                    await ref.watch(authencationProvider.notifier).login(
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
    ));
  }
}
