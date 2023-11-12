import 'package:amar_dokan_app/src/repository/authenticationl_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../helpers/shared_preference_helper.dart';
import '../../navigation/side_navigation_screen.dart';
import '../../widgets/omicron_loader.dart';

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

  Future login(String mobile, String password, BuildContext context,
      TickerProvider tickerProvider) async {
    var response;
    isLoading = true;
    notifyListeners();
    try {
      if (formValidation(mobile, password)) {
        OmicronLoader.showLoader(tickerProvider, context);
        await Future.delayed(const Duration(seconds: 5));
        response = await authRepo.login({"mobile": mobile, "password": password});

        if (response['success'] == true) {
          message = "Successful";
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          isErrorMessage = false;
          notifyListeners();
          await SharedPreferencesHelper.setToken(response['token']);
          await SharedPreferencesHelper.setLoginUserName(response['user']['name']);
          await SharedPreferencesHelper.setLoginUserMobileNo(response['user']['mobile']);
          await SharedPreferencesHelper.setUserAddress(response['user']['address']);
          await SharedPreferencesHelper.setShopId(response['user']['shop_id']);
          await SharedPreferencesHelper.setUserId(response['user']['id']);
          await SharedPreferencesHelper.setRole(response['user']['role']);
          await SharedPreferencesHelper.setSubcriptionStatus(response['user']['subscription_status']);
          await SharedPreferencesHelper.setLoginFlag(true);
          Future.delayed(const Duration(seconds: 1)).then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SideNavigation(),
              ),
            ),
          );
        } else {
          message = "Login Failed!";

          isErrorMessage = true;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          notifyListeners();
        }
      }
    } catch (ex) {
      loginStatus = false;
      message = ex.toString();
      isErrorMessage = true;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      notifyListeners();
    }
    isLoading = false;
    OmicronLoader.hideLoader();
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
