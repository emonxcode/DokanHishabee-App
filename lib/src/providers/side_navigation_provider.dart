import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/products/products_screen.dart';

final sideNavigationProvider = StateNotifierProvider.autoDispose<
    SideNavigationProvider,
    SideNavigationState>((ref) => SideNavigationProvider());

class SideNavigationState {
  SideNavigationState({required this.sideView});
  Widget? sideView = ProductsScreen();
  List<int>? menuColorValue = [1, 0, 0, 0, 0, 0, 0];
}

class SideNavigationProvider extends StateNotifier<SideNavigationState> {
  SideNavigationProvider() : super(SideNavigationState(sideView: ProductsScreen()));
  void changeSideView(Widget view) {
    state = SideNavigationState(sideView: view);
  }

  void setColorValue(int index) {
    for (int i = 0; i < state.menuColorValue!.length; i++) {
      state.menuColorValue![i] = 0;
    }
    state.menuColorValue![index] = 1;
  }
}
