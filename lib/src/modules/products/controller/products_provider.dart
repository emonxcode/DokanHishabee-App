import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var productsProvider = ChangeNotifierProvider<ProductsController>(
    (ref) => ProductsController(ref: ref));

class ProductsController extends ChangeNotifier { 
  ProductsController({required this.ref});

  Ref ref;

  List<dynamic> categoryList = [
    "সকল পণ্য",
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

  List<dynamic> productList = [
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
    {"name": "বাসমোতি চাউল ৫০ কেজি", "isSelected": false},
  ];

  void selectProduct(int index) {
    productList[index]['isSelected'] = !productList[index]['isSelected'];
    notifyListeners();
  }
}
