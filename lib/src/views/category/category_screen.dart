import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/helpers/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Categories",
              style: Styles.pagetitle.copyWith(
                color: theme == "light" ? Colors.black87 : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
