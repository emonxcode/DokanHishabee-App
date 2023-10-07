import 'package:flutter/material.dart';

import '../../../../main.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme == "light"
              ? Color.fromARGB(255, 243, 243, 243)
              : Color.fromARGB(255, 146, 146, 146),
        ),
        child: Center(
          child: Icon(
            Icons.add_a_photo,
            size: 50,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
