import 'package:flutter/material.dart';

import '../../../../main.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
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
      child: Center(
        child: Icon(Icons.document_scanner),
      ),
    );
  }
}
