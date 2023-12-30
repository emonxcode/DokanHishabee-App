import 'dart:convert';
import 'dart:io';

import 'package:amar_dokan_app/src/repositories/category_repo.dart';
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
    isBtnLoading = true;
    notifyListeners();

    try {
      encodeImgToBase64(imageFile!.path);
      var data = {
        "name": categoryNameTextController.text,
        "img": encodedBase64Image,
      };
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
          var cat = Category.fromJson(category);
          var bytes = base64.decode(cat.img!);
          final directory = await getApplicationDocumentsDirectory();
          var file = File('${directory.path}/testImage.png');
          await file.writeAsBytes(List.from(bytes));

          cat.imageFile = file;
          categories.add(cat);
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
    isDataLoading = false;
    notifyListeners();
  }
}
