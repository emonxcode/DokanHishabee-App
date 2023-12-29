import 'package:flutter/material.dart';


class CategoryNameField extends StatelessWidget {
  const CategoryNameField({
    super.key,
    required this.categoryNameController,
  });

  final TextEditingController categoryNameController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 65,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 2,
              color: Color.fromARGB(255, 238, 238, 238),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: TextField(
          controller: categoryNameController,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.account_tree_rounded),
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "Enter category name",
          ),
        ),
      ),
    );
  }
}
