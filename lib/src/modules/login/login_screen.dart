import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:amar_dokan_app/src/modules/login/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/app_space.dart';
import '../../utils/colors.dart';
import '../widgets/dokan_hishabee_text.dart';
import '../widgets/dokan_hishabee_text_field.dart';
import '../widgets/garibook_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  var authKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(authencationProvider);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: authKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/images/dokanee.png",
                    ),
                  ),
                  AppSpace.spaceH10,
                  const DokanHishabeeTextWidget(
                    text: "Dokanee",
                    color: AppColors.primaryTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  AppSpace.spaceH30,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: DokanHishabeeTextWidget(
                        text: "Mobile",
                        color: AppColors.darkGrey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  AppSpace.spaceH4,
                  DokanHishabeeTextField(
                    controller: controller.mobileTextController,
                    maxLines: 1,
                    obscureText: false,
                    hint: 'Enter mobile number',
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter mobile!';
                      }
                      return null;
                    },
                  ),
                  AppSpace.spaceH18,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: DokanHishabeeTextWidget(
                        text: "Password",
                        color: AppColors.darkGrey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  AppSpace.spaceH4,
                  DokanHishabeeTextField(
                    controller: controller.passwordTextController,
                    maxLines: 1,
                    obscureText: !controller.showPass,
                    hint: 'Enter mobile Password',
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password!';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.showPass
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  AppSpace.spaceH50,
                  SizedBox(
                    height: 50,
                    width: context.width * 0.8,
                    child: DokanHishabeeButton(
                      onTap: controller.isLoading == false
                          ? () {
                              FocusScope.of(context).unfocus();
                              if (authKey.currentState!.validate()) {
                                controller.login(context: context);
                              }
                            }
                          : () {},
                      isLoading: controller.isLoading,
                      buttonHeight: 50,
                      borderRadius: 15,
                      borderColor: AppColors.scaffoldBackGroundColor,
                      gradient: AppColors.blueButtonGradient,
                      textColor: AppColors.whiteColor,
                      fontSize: 14,
                      buttonText: 'Login',
                      showIcon: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
