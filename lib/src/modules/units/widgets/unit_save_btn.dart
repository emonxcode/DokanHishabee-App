import 'package:flutter/material.dart';

class UnitSaveButton extends StatelessWidget {
  const UnitSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () {},
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
            child: Text(
              "SAVE",
              // style:
              //     Styles.pagetitle.copyWith(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
