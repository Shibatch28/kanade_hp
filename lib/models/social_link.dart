import 'package:flutter/material.dart';

/// ソーシャルリンクを管理するモデルクラス
///
/// パラメータ:
/// - [icon]: アイコンデータ
/// - [label]: ラベルテキスト
/// - [url]: リンクURL
///
/// 使用例:
/// ```dart
/// final socialLink = SocialLink(
/// icon: Icons.twitter,
/// label: 'Twitter',
/// url: 'https://twitter.com/yourprofile',
/// );
/// ```
///
/// このクラスは、アプリケーション内でソーシャルメディアリンクを一元管理するために使用されます。
/// 各インスタンスは、特定のソーシャルメディアプラットフォームへのリンク情報を保持します。
class SocialLink {
  final IconData icon;
  final String label;
  final String url;

  const SocialLink({
    required this.icon,
    required this.label,
    required this.url,
  });
}
