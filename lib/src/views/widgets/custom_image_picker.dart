import 'package:amar_dokan_app/src/helpers/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomImagePicker extends ConsumerStatefulWidget {
  CustomImagePicker(
      {required this.imageType,
      required this.onTap,
      required this.ImageFile,
      required this.onDelete,
      super.key,
      this.height,
      this.width,
      this.color,
      this.borderColor});

  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  dynamic ImageFile;
  final imageType;
  final Function() onTap;
  final Function() onDelete;

  @override
  ConsumerState<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends ConsumerState<CustomImagePicker> {
  dynamic authenticationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // authenticationProvider = ref.watch(signInSignUpController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color ?? AppColors.whiteColor,
          border:
              Border.all(color: widget.borderColor ?? AppColors.whiteColor)),
      child: InkWell(
          onTap: widget.onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: widget.ImageFile == null
                  ? Image.asset('assets/images/splash_screen/Vector.png')
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          widget.ImageFile,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: -8,
                          top: -10,
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.red,
                            ),
                            onPressed: widget.onDelete,
                          ),
                        )
                      ],
                    ))),
    );
  }
}
