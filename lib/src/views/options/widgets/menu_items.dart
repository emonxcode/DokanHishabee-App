import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../helpers/styles/styles.dart';
import '../../../helpers/utils/app_space.dart';

class OptionsItemView extends StatelessWidget {
  const OptionsItemView({super.key, required this.imgUrl, required this.label});

  final String imgUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: context.width * 0.35,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(imgUrl),
          ),
          AppSpace.spaceH10,
          Text(label,
              style: Styles.h1.copyWith(
                color: theme == "light"
                    ? Colors.black54
                    : Color.fromARGB(255, 255, 255, 255),
              )),
        ],
      ),
    );
  }
}
