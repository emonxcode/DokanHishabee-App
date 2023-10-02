import 'package:amar_dokan_app/src/providers/side_navigation_provider.dart';
import 'package:amar_dokan_app/src/views/home.dart';
import 'package:amar_dokan_app/src/views/home_two.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideNavigation extends ConsumerWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (context, s_ref, child) {
          var state = s_ref.watch(sideNavigationProvider);
          print(state.sideView);
          return Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black87,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              ref
                                  .read(sideNavigationProvider.notifier)
                                  .changeSideView(HomeScreen());
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref
                                  .read(sideNavigationProvider.notifier)
                                  .changeSideView(HomeScreenTwo());
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  Icons.home_repair_service,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.white,
                    child: state.sideView,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
