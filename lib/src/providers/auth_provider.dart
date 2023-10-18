import 'package:amar_dokan_app/src/repository/authenticationl_repository.dart';
import 'package:amar_dokan_app/src/services2/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/navigation/side_navigation_screen.dart';

final authencationProvider =
    ChangeNotifierProvider.autoDispose<AuthenticationController>(
        (ref) => AuthenticationController());

/// provider
class AuthenticationController extends ChangeNotifier {
  AuthenticationRepository authRepo = AuthenticationRepository();
  bool showPass = false;
  bool loginStatus = false;
  String message = "";
  String? mabileFieldError = null;
  String? passFieldError = null;
  bool isErrorMessage = false;
  bool isLoading = false;

  Future login(String mobile, String password, BuildContext context) async {
    isLoading = true;
    var response;
    notifyListeners();
    try {
      if (formValidation(mobile, password)) {
        response = await authRepo.login({"mobile": mobile, "password": password});

        if (response['success'] == true) {
          message = "Successful";
          isErrorMessage = false;
          notifyListeners();
          Future.delayed(Duration(seconds: 1)).then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SideNavigation(),
              ),
            ),
          );
        } else {
          message = "Login Failed!";
          isErrorMessage = true;
          notifyListeners();
        }
      }
    } catch (ex) {
      loginStatus = false;
      message = ex.toString();
      isErrorMessage = true;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  bool formValidation(String mobile, String password) {
    if (mobile.isEmpty && password.isNotEmpty) {
      mabileFieldError = "Please provide your phone number";
      passFieldError = "";
      message = "Validation Error!!";
      isErrorMessage = true;
    } else if (password.isEmpty && mobile.isNotEmpty) {
      mabileFieldError = "";
      passFieldError = "Please provide your password";
      message = "Validation Error!!";
      isErrorMessage = true;
    } else if (password.isEmpty && mobile.isEmpty) {
      mabileFieldError = "Please provide your phone number";
      passFieldError = "Please provide your password";
      message = "Validation Error!!";
      isErrorMessage = true;
    } else {
      mabileFieldError = null;
      passFieldError = null;
      message = "";
      isErrorMessage = false;
    }
    notifyListeners();

    return mobile.isNotEmpty && password.isNotEmpty ? true : false;
  }

  void togglePasswordVisibility() {
    showPass = !showPass;
    notifyListeners();
  }
}
