import 'package:amar_dokan_app/src/modules/widgets/sneak_bar.dart';
import 'package:amar_dokan_app/src/repositories/auth_repo/authentication_repository.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../local/shared_preference_helper.dart';
import '../../navigation/side_navigation_screen.dart';
import '../../widgets/omicron_loader.dart';

final authencationProvider = ChangeNotifierProvider<AuthenticationController>(
    (ref) => AuthenticationController());

/// provider
class AuthenticationController extends ChangeNotifier {
  AuthenticationRepository authRepo = AuthenticationRepository();
  var mobileTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  bool showPass = false;
  bool isLoading = false;

  Future login(
      {required BuildContext context,
      required TickerProvider tickerProvider}) async {
    var response;
    isLoading = true;
    notifyListeners();
    try {
      // OmicronLoader.showLoader(tickerProvider, context);
      await Future.delayed(const Duration(seconds: 5));
      response = await authRepo.login({
        "mobile": mobileTextController.text,
        "password": passwordTextController.text
      });

      if (response['success'] == true) {
        mobileTextController.clear();
        passwordTextController.clear();
        await LocalData.setToken(response['token']);
        await LocalData.setLoginUserName(response['user']['name']);
        await LocalData.setLoginUserMobileNo(response['user']['mobile']);
        await LocalData.setUserAddress(response['user']['address']);
        await LocalData.setShopId(response['user']['shop_id']);
        await LocalData.setUserId(response['user']['id']);
        await LocalData.setRole(response['user']['role']);
        await LocalData.setSubcriptionStatus(
            response['user']['subscription_status']);
        await LocalData.setLoginFlag(true);
        Future.delayed(const Duration(seconds: 1)).then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SideNavigation(),
            ),
          ),
        );
      } else {
        if (context.mounted) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: AppColors.redColor,
          );
        }
        notifyListeners();
      }
    } catch (ex) {

      if (context.mounted) {
        DokanSneakBar.customSnackBar(
          context: context,
          snackText: ex.toString(),
          snackBackgroundColor: AppColors.redColor,
        );
      }
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    showPass = !showPass;
    notifyListeners();
  }
}
