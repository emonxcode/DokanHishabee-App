import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/utils/app_space.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import '../../../main.dart';
import '../../helpers/styles/styles.dart';
import 'widgets/scanner_btn.dart';
import 'widgets/search_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: Duration(milliseconds: 300),
        offset: Offset(0, context.height * 0.5),
        child: SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpace.spaceH4,
                Text(
                  "Bismillah General Store",
                  style: Styles.pagetitle.copyWith(
                    color: theme == "light" ? Colors.black87 : Colors.white,
                  ),
                ),
                Text(
                  "All Products",
                  style: Styles.pagetitle.copyWith(
                      fontSize: 15, color: Color.fromARGB(221, 105, 105, 105)),
                ),
                AppSpace.spaceH18,
                Row(
                  children: [
                    ProductSearchBar(),
                    Spacer(),
                    ScannerButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
