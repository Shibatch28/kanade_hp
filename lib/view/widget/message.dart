import 'package:flutter/material.dart';

/// ウェルカムメッセージを表示するウィジェット。
///
/// タイトルとメッセージを含むセクションを表示します。
class WelcomeMessage extends StatelessWidget {
  // 表示したいタイトルとメッセージをコンストラクタで受け取る
  final String title;
  final String message;

  const WelcomeMessage({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    // テーマから情報を取得
    final theme = Theme.of(context);

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
                style:
                    theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ) ??
                    const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 24), // タイトルと本文の間の余白
              // メッセージ本文
              Text(
                message,
                textAlign: TextAlign.center,
                style:
                    theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                      height: 1.8,
                    ) ??
                    const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.8,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
