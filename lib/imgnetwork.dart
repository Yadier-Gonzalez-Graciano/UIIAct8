import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(ImgNetwork());

class ImgNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Images"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Image.network(
          "https://raw.githubusercontent.com/Yadier-Gonzalez-Graciano/img-flutterflow_ios_6j/main/Act%2013%20GridView%20Flutter%20Flow/carnessssss.jpg",
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
