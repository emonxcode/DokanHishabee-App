import 'package:flutter/material.dart';

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
          color:Color.fromARGB(255, 243, 243, 243)
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
