import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:amar_dokan_app/src/modules/login/login_screen.dart';
import 'package:amar_dokan_app/src/repositories/category_repo.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/colors.dart';
import '../../widgets/sneak_bar.dart';
import '../models/category.dart';

var categoryProvider = ChangeNotifierProvider((ref) => CategoryController());

class CategoryController extends ChangeNotifier {
  bool isBtnLoading = false;
  bool isDataLoading = false;
  CategoryRepository categoryRepository = CategoryRepository();
  var categoryNameTextController = TextEditingController();
  File? imageFile;

  void setImageFile(File file) {
    imageFile = file;
    notifyListeners();
  }


  Future createCategory({required BuildContext context}) async {
    if (imageFile == null) {
      DokanSneakBar.customSnackBar(
        context: context,
        snackText: "Please select image.",
        snackBackgroundColor: AppColors.redColor,
      );
      return;
    }else if(categoryNameTextController.text.isEmpty){
      DokanSneakBar.customSnackBar(
        context: context,
        snackText: "Please enter category name.",
        snackBackgroundColor: AppColors.redColor,
      );
      return;
    }

    dynamic response;
    isBtnLoading = true;
    notifyListeners();

    try {
      var data = {
        "name": categoryNameTextController.text,
      };
      
      response = await categoryRepository.createCategory(data, imageFile!);

      if (response['success'] == true) {
        if (context.mounted) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: AppColors.greenColor,
          );
          getAllCategories(context: context);
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
    notifyListeners();
  }

  var categories = <Category>[];
  Future getAllCategories({required BuildContext context}) async {
    dynamic response;
    isDataLoading = true;
    notifyListeners();

    try {
      response = await categoryRepository.getCategories();

      if (response['success'] == true) {
        categories.clear();
        for (var category in response['result']) {
          categories.add(Category.fromJson(category));
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
    isDataLoading = false;
    notifyListeners();
  }
}
