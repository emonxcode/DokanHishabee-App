import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../utils/colors.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.width * 0.6,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 2,
              color: AppColors.lightGrey)
        ],
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            border: InputBorder.none,
            hintStyle: const TextStyle(fontSize: 16),
            hintText: "Search Products"),
      ),
    );
  }
}
