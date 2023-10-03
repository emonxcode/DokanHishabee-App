import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.width * 0.6,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 2,
            color: theme == "light"
                ? Color.fromARGB(255, 236, 236, 233)
                : Colors.black,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color:
            theme == "light" ? Colors.white : Color.fromARGB(255, 92, 92, 92),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            border: InputBorder.none,
            hintText: "Search Products"),
      ),
    );
  }
}
