import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/providers/auth_provider.dart';
import 'package:amar_dokan_app/src/views/widgets/dokan_hishabee_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';
import '../../../main.dart';
import '../../helpers/utils/app_space.dart';
import '../../helpers/utils/colors.dart';
import 'widgets/mobile_text_field.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  var mobileTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  AuthenticationController? _controller;
 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = ref.watch(authencationProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            DokanHishabeeTextWidget(
              text: "Dokan Hishabee - দোকান হিসাবী",
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
            AppSpace.spaceH20,
            MobileTextField(mobileTextController: mobileTextController),
            AppSpace.spaceH18,
            PasswordTextField(passwordTextController: passwordTextController),
            AppSpace.spaceH20,
            SizedBox(
              height: 50,
              width: context.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme == "light"
                      ? AppColors.primaryColor
                      : AppColors.lightGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();

                  await ref.read(authencationProvider.notifier).login(
                        mobileTextController.text,
                        passwordTextController.text,
                        context,
                        this
                      );
                },
                child: DokanHishabeeTextWidget(
                  text: "Login",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: theme == "dark"
                      ? AppColors.primaryColor
                      : AppColors.lightGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
