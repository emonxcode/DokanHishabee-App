import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
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
                  flex: 18,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black87,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppSpace.spaceH20,
                          InkWell(
                            onTap: () {
                              ref
                                  .read(sideNavigationProvider.notifier)
                                  .changeSideView(HomeScreen());
                            },
                            child: Container(
                              height: 110,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "HOME",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                              height: 110,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 30,
                                    color: Colors.lightGreen,
                                  ),
                                  AppSpace.spaceH4,
                                  Text(
                                    "CART",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.lightGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                              height: 110,
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  size: 30,
                                  Icons.shopping_bag,
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
                              height: 110,
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  size: 30,
                                  Icons.report,
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
                              height: 110,
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  size: 30,
                                  Icons.dashboard,
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
                              height: 110,
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  size: 30,
                                  Icons.menu_book,
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
                  flex: 85,
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
