// lib/views/widgets/welcome_message.dart
import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  // 表示したいタイトルとメッセージをコンストラクタで受け取る
  final String title;
  final String message;

  const WelcomeMessage({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      // セクション全体のデザイン
      width: double.infinity,
      color: Colors.black, // 背景を黒に変更
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          // Webで横幅が広がりすぎないように最大幅を設定
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // タイトル部分
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // タイトルを白文字に変更
                ),
              ),
              const SizedBox(height: 24), // タイトルと本文の間の余白
              // メッセージ本文
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70, // 本文を少し透明度のある白文字に変更
                  height: 1.8, // 行間を少し広げて読みやすくする
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
