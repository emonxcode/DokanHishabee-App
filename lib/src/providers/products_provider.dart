import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var productsProvider = ChangeNotifierProvider<ProductsController>(
    (ref) => ProductsController(ref: ref));

class ProductsController extends ChangeNotifier {
  ProductsController({required this.ref});

  Ref ref;

  List<dynamic> categoryList = [
    "মুদি মাল",
    "পানীয়",
    "বিস্কুট",
    "চানাচুর",
    "চকলেট"
  ];
  int selectedCategory = 0;

  void selectCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
}
