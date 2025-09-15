import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
            "assets/logo.svg",
            height: 32,
            semanticsLabel: "近藤 奏のホームページ",
          ),
        ),
        // 右側のアクションボタン（ハンバーガーメニュー）
        actions: [
          Container(
            width: 48, // アイコンボタンの幅を指定
            margin: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              tooltip: "メニューを開く", // アクセシビリティ対応
              onPressed: () {
                // ハンバーガーメニューが押されたときの処理をここに書く
                print("Menu button pressed!");
              },
            ),
          ),
        ],
      ),
    );
  }
}
