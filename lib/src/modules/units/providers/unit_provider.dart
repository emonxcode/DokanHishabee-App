import 'package:amar_dokan_app/src/modules/units/models/unit_model.dart';
import 'package:amar_dokan_app/src/repositories/unit_repo.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../login/login_screen.dart';
import '../../widgets/sneak_bar.dart';

var unitProvider = StateNotifierProvider<UnitsController, UnitState>(
    (ref) => UnitsController(ref: ref));

class UnitState {}

class UnitsController extends StateNotifier<UnitState> {
  UnitsController({required this.ref}) : super(UnitState());

  Ref ref;
  UnitRepository repository = UnitRepository();
  bool isLoading = false;
  bool isBtnLoading = false;
  var unitNameTextController = TextEditingController();

  Future createUnit({required BuildContext context}) async {
    if (unitNameTextController.text.isEmpty) {
      DokanSneakBar.customSnackBar(
        context: context,
        snackText: "Please enter unit name.",
        snackBackgroundColor: AppColors.redColor,
      );
      return;
    }

    dynamic response;
    isBtnLoading = true;
    ref.notifyListeners();

    try {
      var data = {
        "name": unitNameTextController.text,
        "code": unitNameTextController.text
      };

      response = await repository.createUnit(data);

      if (response['success'] == true) {
        if (context.mounted) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: AppColors.greenColor,
          );
          getAllUnits(context: context);
        }
      } else {
        if (context.mounted) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: AppColors.redColor,
          );
        }
      }
    } catch (ex) {
      if (context.mounted) {
        DokanSneakBar.customSnackBar(
          context: context,
          snackText: ex.toString(),
          snackBackgroundColor: AppColors.redColor,
        );
      }
    }
    isBtnLoading = false;
    ref.notifyListeners();
  }

  var units = <Unit>[];
  Future getAllUnits({required BuildContext context}) async {
    Map<String, dynamic> response;
    isLoading = true;
    ref.notifyListeners();

    try {
      response = await repository.getUnits();

      if (response['success'] == true) {
        units.clear();
        for (var unit in response['result']) {
          units.add(Unit.fromJson(unit));
        }
      } else {
        if (response['message'] == 'Unathorized!') {
          if (context.mounted) {
            context.pushAndRemoveUntil(const LoginScreen());
          }
          return;
        }
        if (context.mounted) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: AppColors.redColor,
          );
        }
      }
    } catch (ex) {
      if (context.mounted) {
        if (!ex
            .toString()
            .startsWith("FormatException: Invalid encoding before padding")) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: ex.toString(),
            snackBackgroundColor: AppColors.redColor,
          );
        }
      }
    }
    isLoading = false;
    ref.notifyListeners();
  }
}
