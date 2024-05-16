import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(ImgAssets());

class ImgAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Images"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Image.asset(
          "assets/Frutas1-removebg-preview.png",
          width: 250,
          height: 250,
          fit: BoxFit.contain,
          frameBuilder: (context, child, frame, loaded) {
            if (loaded) {
              return child;
            }
            return AnimatedOpacity(
              child: child,
              opacity: frame == null ? 0 : 1,
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
            );
          },
          errorBuilder: (context, exception, stackTrace) {
            return Center(
              child: Text("No Images loaded"),
            );
          },
        ),
      ), //container 1
    );
  }
}
