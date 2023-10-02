
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/home.dart';

final sideNavigationProvider = StateNotifierProvider.autoDispose<
    SideNavigationProvider,
    SideNavigationState>((ref) => SideNavigationProvider());

class SideNavigationState {
  SideNavigationState({required this.sideView});
  Widget? sideView = HomeScreen();
}

class SideNavigationProvider extends StateNotifier<SideNavigationState> {
  SideNavigationProvider() : super(SideNavigationState(sideView: HomeScreen()));
  void changeSideView(Widget view) {
    state = SideNavigationState(sideView: view);
  }
}
