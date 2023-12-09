import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../products/views/products_screen.dart';

final sideNavigationProvider =
    ChangeNotifierProvider.autoDispose<SideNavigationController>(
        (ref) => SideNavigationController());

class SideNavigationController extends ChangeNotifier {
  SideNavigationController();
  Widget? sideView = const ProductsScreen();
  List<int>? menuColorValue = [1, 0, 0, 0, 0, 0, 0];

  void changeSideView(Widget view) {
    sideView = view;
    notifyListeners();
  }

  void setColorValue(int index) {
    for (int i = 0; i < menuColorValue!.length; i++) {
      menuColorValue![i] = 0;
    }
    menuColorValue![index] = 1;
    notifyListeners();
  }
}
