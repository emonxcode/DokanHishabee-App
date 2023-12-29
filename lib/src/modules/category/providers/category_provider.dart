import 'dart:convert';
import 'dart:io';

import 'package:amar_dokan_app/src/repositories/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../widgets/sneak_bar.dart';

var categoryProvider = ChangeNotifierProvider((ref) => CategoryController());

class CategoryController extends ChangeNotifier {
  bool isLoading = false;
  CategoryRepository categoryRepository = CategoryRepository();
  var categoryNameTextController = TextEditingController();
  var encodedBase64Image = "";
  File? imageFile;

  void setImageFile(File file) {
    imageFile = file;
    notifyListeners();
  }

  void encodeImgToBase64(String path) {
    final bytes = File(path).readAsBytesSync();
    encodedBase64Image = base64Encode(bytes);
  }

  Future createCategory({required BuildContext context}) async {
    if (imageFile == null || categoryNameTextController.text.isEmpty) {
      DokanSneakBar.customSnackBar(
        context: context,
        snackText: "Please select image or provide category name!",
        snackBackgroundColor: AppColors.redColor,
      );
      return;
    }

    dynamic response;
    isLoading = true;
    notifyListeners();

    try {
      encodeImgToBase64(imageFile!.path);
      var data = {
        "name": categoryNameTextController.text,
        "img": encodedBase64Image,
      };
      await Future.delayed(const Duration(seconds: 1));
      response = await categoryRepository.createCategory(data);

      if (response['success'] == true) {
        if (context.mounted) {
          DokanSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: AppColors.greenColor,
          );
        }
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
}
