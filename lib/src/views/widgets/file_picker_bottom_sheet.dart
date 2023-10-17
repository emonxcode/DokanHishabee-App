import 'dart:io';
import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dokan_hishabee_text.dart';


class FilePicker extends StatelessWidget {
  File? file;

  FilePicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const DokanHishabeeTextWidget(
              text: 'Select_Source',
              //style: bb_text_style_24_bold_black,

              fontSize: 22, color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _bottomSheetOptions(
                    context: context,
                    label: 'CAMERA',
                    icon: Icons.camera,
                    onClicked: () => _selectedItem(context, 0)),
                _bottomSheetOptions(
                    context: context,
                    label: 'Gallery',
                    icon: Icons.image,
                    onClicked: () => _selectedItem(context, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectedItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        await _openCamera(context);

        Navigator.pop(context, file);

        break;
      case 1:
        await _openGallery(context);

        Navigator.pop(context, file);

        break;
    }
  }

  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024);

    if (pickedFile != null) {
      file = File(pickedFile.path);
      return file;
    } else {
      return null;
    }
  }

  _openCamera(BuildContext context) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024,
        preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      return file;
    } else {
      return null;
    }
  }
}

Widget _bottomSheetOptions({
  required BuildContext context,
  required String? label,
  required IconData? icon,
  VoidCallback? onClicked,
}) {
  return SizedBox(
    width: 120,
    height: 120,
    child: GestureDetector(
      onTap: onClicked,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
            size: 30,
            // width: 50,
            // height: 50,
          ),
          DokanHishabeeTextWidget(
            text: label!,
          ),
        ],
      ),
    ),
  );
}
