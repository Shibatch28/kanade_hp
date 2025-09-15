import 'package:flutter/material.dart';

class MainVisual extends StatelessWidget {
  const MainVisual({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = screenHeight - appBarHeight - statusBarHeight;
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/kanadesample.png",
          width: double.infinity,
          height: availableHeight,
          fit: BoxFit.cover,
        ),

        Container(
          width: double.infinity,
          height: availableHeight,
          color: Colors.black.withValues(alpha: 0.4), // 半透明の黒
        ),
      ],
    );
  }
}
