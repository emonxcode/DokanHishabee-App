import 'package:flutter/material.dart';

import '../../../helpers/styles/styles.dart';

class CategorySaveButton extends StatelessWidget {
  const CategorySaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.green,
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              "SAVE",
              style:
                  Styles.pagetitle.copyWith(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
      flex: 2,
    );
  }
}
