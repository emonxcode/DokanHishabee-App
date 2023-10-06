import 'package:amar_dokan_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/navigation/side_navigation_screen.dart';

final authencationProvider = StateNotifierProvider.autoDispose<
    AuthenticationProvider,
    AuthenticationState>((ref) => AuthenticationProvider());

class AuthenticationState {
  AuthenticationState();
  String message = "";
}

class AuthenticationInitState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {
  String message = "Authenticating...";
  bool loginStatus = false;
}

class AuthenticationLoadedState extends AuthenticationState {
  AuthenticationLoadedState({required this.message, required this.loginStatus});

  String message = "";
  bool loginStatus = false;
}

class AuthenticationErrorState extends AuthenticationState {
  AuthenticationErrorState({required this.message, required this.loginStatus});

  String message = "";
  bool loginStatus = false;
}

class AuthenticationFormFieldErrorState extends AuthenticationState {
  AuthenticationFormFieldErrorState(
      {required this.mabileFieldError, required this.passFieldError});

  String mabileFieldError = "";
  String passFieldError = "";
  String message = "Validation error!";
}

class PasswordVisibilityState extends AuthenticationState {}

/// provider
class AuthenticationProvider extends StateNotifier<AuthenticationState> {
  AuthenticationProvider() : super(AuthenticationInitState());
  bool showPass = false;
  bool loginStatus = false;
  String message = "";

  Future login(String mobile, String password, BuildContext context) async {
    try {
      state = AuthenticationLoadingState();
      if (formValidation(mobile, password)) {
        state = AuthenticationLoadingState();
        loginStatus = await AuthService().login(mobile, password);

        if (loginStatus) {
          message = "Successful";
          state = AuthenticationLoadedState(
              message: message, loginStatus: loginStatus);
          Future.delayed(Duration(seconds: 1)).then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SideNavigation(),
              ),
            ),
          );
        } else {
          message = "Failed!";
          state = AuthenticationErrorState(
              message: message, loginStatus: loginStatus);
        }
      }
    } catch (ex) {
      loginStatus = false;
      message = ex.toString();
      state =
          AuthenticationErrorState(message: message, loginStatus: loginStatus);
    }
  }

  bool formValidation(String mobile, String password) {
    if (mobile.isEmpty && password.isNotEmpty) {
      state = AuthenticationFormFieldErrorState(
          mabileFieldError: "Please provide your phone number",
          passFieldError: "");
    } else if (password.isEmpty && mobile.isNotEmpty) {
      state = AuthenticationFormFieldErrorState(
          mabileFieldError: "", passFieldError: "Please provide your password");
    } else {
      state = AuthenticationFormFieldErrorState(
          mabileFieldError: "Please provide your phone number",
          passFieldError: "Please provide your password");
    }

    return mobile.isNotEmpty && password.isNotEmpty ? true : false;
  }

  void togglePasswordVisibility() {
    showPass = !showPass;
    state = AuthenticationState();
  }
}
