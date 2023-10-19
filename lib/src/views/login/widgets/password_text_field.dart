import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';
import '../../../helpers/styles/styles.dart';
import '../../../providers/auth_provider.dart';

class PasswordTextField extends ConsumerStatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordTextController,
  });

  final TextEditingController passwordTextController;

  @override
  ConsumerState<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends ConsumerState<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var controller = ref.watch(authencationProvider);
        return Container(
          height: controller.passFieldError != null &&
                  controller.passFieldError!.isNotEmpty
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
                    ? AppColors.lightGrey
                    : Theme.of(context).scaffoldBackgroundColor
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: theme == "light"
                ? AppColors.whiteColor
                : AppColors.darkGrey
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: widget.passwordTextController,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(fontSize: 18),
                obscureText: !controller.showPass,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                    icon: Icon(controller.showPass
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              ),
              if (controller.passFieldError != null &&
                  controller.passFieldError!.isNotEmpty)
                Text(
                  controller.passFieldError!,
                  style: Styles.defaultStyle.copyWith(color: AppColors.redColor),
                ),
            ],
          ),
        );
      },
    );
  }
}
