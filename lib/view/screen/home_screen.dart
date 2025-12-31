import 'package:flutter/material.dart';
import "package:kanade_hp/view/widget/main_visual.dart";

/// ホーム画面を表示するウィジェット。
///
/// メインビジュアルを表示します。
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainVisual(title: '近藤奏 Off cial', imageDirectory: 'main_visual'),
      ],
    );
  }
}
