import 'package:amar_dokan_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/navigation/side_navigation_screen.dart';

final authencationProvider = StateNotifierProvider.autoDispose<
    AuthenticationProvider,
    AuthenticationState>((ref) => AuthenticationProvider());

class AuthenticationState {
  AuthenticationState();
}

class AuthenticationInitState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

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

class AuthenticationProvider extends StateNotifier<AuthenticationState> {
  AuthenticationProvider() : super(AuthenticationInitState());

  Future login(String mobile, String password, BuildContext context) async {
    bool loginStatus = false;
    String message = "";

    try {
      state = AuthenticationLoadingState();
      await Future.delayed(Duration(seconds: 5));
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
    } catch (ex) {
      loginStatus = false;
      message = ex.toString();
      state =
          AuthenticationErrorState(message: message, loginStatus: loginStatus);
    }
  }
}
