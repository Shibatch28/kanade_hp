import 'package:flutter/material.dart';
import "package:kanade_hp/view/widget/main_visual.dart";

class ConcertsScreen extends StatelessWidget {
  const ConcertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainVisual(title: 'コンサート情報', imageDirectory: 'concerts', height: 200),
      ],
    );
  }
}
