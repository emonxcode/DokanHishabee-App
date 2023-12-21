import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gif/gif.dart';

class OmicronLoader {
 static void showLoader(TickerProvider tickerProvider, BuildContext context) {
    GifController? _gifController = GifController(vsync: tickerProvider);
    Loader.show(
      context,
      progressIndicator: Gif(
        height: 80,
        width: 80,
        image: AssetImage("assets/image/omicron_loader.gif"),
        colorBlendMode: BlendMode.darken,
        controller: _gifController,
        autostart: Autostart.loop,
        placeholder: (context) => Material(child: Text('Loading...')),
        onFetchCompleted: () {
          _gifController.reset();
          _gifController.forward();
        },
      ),
    );
  }

 static void hideLoader() {
    Loader.hide();
  }
}
