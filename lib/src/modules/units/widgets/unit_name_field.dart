import 'package:flutter/material.dart';

import '../../../../main.dart';

class UnitNameField extends StatelessWidget {
  const UnitNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 2,
              color: theme == "light"
                  ? Color.fromARGB(255, 238, 238, 238)
                  : Color.fromARGB(255, 87, 87, 87),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: theme == "light"
              ? Color.fromARGB(255, 255, 255, 255)
              : Color.fromARGB(255, 124, 124, 124),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_tree_rounded),
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "Enter unit name",
          ),
        ),
      ),
    );
  }
}
