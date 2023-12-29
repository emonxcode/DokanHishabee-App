import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

class CategorySaveButton extends StatelessWidget {
  const CategorySaveButton({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  final Function onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.green,
          ),
          width: double.infinity,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: AppColors.whiteColor)
                : const Text(
                    "SAVE",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
