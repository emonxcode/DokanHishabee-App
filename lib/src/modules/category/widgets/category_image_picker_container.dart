import 'package:amar_dokan_app/src/modules/widgets/file_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 243, 243, 243)),
      child: const Center(
        child: Icon(
          Icons.add_a_photo,
          size: 50,
          color: Colors.black54,
        ),
      ),
    );
  }
}
