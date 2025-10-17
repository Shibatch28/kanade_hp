import 'package:flutter/cupertino.dart';

/// 画面サイズに応じたレスポンシブ判定を行うユーティリティクラス
class Responsive {
  static const int mobileMaxWidth = 600;
  static const int tabletMaxWidth = 1024;

  /// 画面幅がモバイルサイズ以下かを判定
  /// [context] BuildContext
  /// @return モバイルサイズ以下の場合はtrue、それ以外はfalse
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileMaxWidth;
  }

  /// 画面幅がタブレットサイズかを判定
  /// [context] BuildContext
  /// @return タブレットサイズの場合はtrue、それ以外はfalse
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > mobileMaxWidth && width <= tabletMaxWidth;
  }

  /// 画面幅がデスクトップサイズかを判定
  /// [context] BuildContext
  /// @return デスクトップサイズの場合はtrue、それ以外はfalse
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > tabletMaxWidth;
  }
}
