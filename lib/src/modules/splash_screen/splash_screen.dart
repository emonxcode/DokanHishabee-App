import 'package:amar_dokan_app/src/modules/login/login_screen.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../local/shared_preference_helper.dart';
import '../../utils/app_space.dart';
import '../../utils/colors.dart';
import '../navigation/side_navigation_screen.dart';
import '../widgets/dokan_hishabee_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goRoute();
  }

  goRoute() async {
    var isLoggedIn = await LocalData.getLoginFlag();
    if (isLoggedIn) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SideNavigation(),
          ),
        ),
      );
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: context.height,
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/logo/app_logo_round.png",
                  ),
                ),
                AppSpace.spaceH18,
                const DokanHishabeeTextWidget(
                  text: "Dokan Hishabee - দোকান হিসাবী",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                AppSpace.spaceH10,
                // Text(
                //   "v1.0.0",
                //  // style: Styles.defaultStyle,
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/logo/omicron.png",
                    ),
                  ),
                  AppSpace.spaceW10,
                  Text(
                    "Artix Studio",
                    // style: Styles.pagetitle.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
