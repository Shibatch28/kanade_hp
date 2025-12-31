import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// アプリケーションのテーマを定義するクラス。
///
/// シックなカラーパレットとGoogle Fontsを使用した
/// ライトテーマを提供します。
class AppTheme {
  /// プライマリブラック
  static const Color primaryBlack = Color(0xFF1A1A1A);
  /// プライマリホワイト
  static const Color primaryWhite = Color(0xFFFAFAFA);
  /// チャコール
  static const Color charcoal = Color(0xFF2C2C2C);
  /// ライトグレー
  static const Color lightGrey = Color(0xFFE8E8E8);
  /// ミディアムグレー
  static const Color mediumGrey = Color(0xFF707070);
  /// ダークグレー
  static const Color darkGrey = Color(0xFF3A3A3A);

  /// ライトテーマの定義
  static ThemeData get lightTheme {
    // 事前にテキストテーマを作成
    final textTheme = GoogleFonts.zenMaruGothicTextTheme();

    return ThemeData(
      fontFamily: GoogleFonts.zenMaruGothic().fontFamily,
      colorScheme: const ColorScheme.light(
        primary: primaryBlack,
        secondary: charcoal,
        surface: primaryWhite,
        onSurface: darkGrey,
        onPrimary: primaryWhite,
      ),

      textTheme: textTheme.copyWith(
        headlineLarge: textTheme.headlineLarge?.copyWith(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: primaryBlack,
          letterSpacing: 2.0,
          height: 1.2,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: darkGrey,
          letterSpacing: 1.5,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: darkGrey,
          letterSpacing: 0.8,
          height: 2.0,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: mediumGrey,
          letterSpacing: 0.5,
          height: 1.8,
        ),
      ),

      // AppBarのテーマ
      appBarTheme: AppBarTheme(
        backgroundColor: primaryWhite,
        foregroundColor: darkGrey,
        elevation: 0,
        shadowColor: Colors.transparent,
        titleTextStyle: GoogleFonts.zenMaruGothic(
          color: darkGrey,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        ),
      ),

      // ボタンのテーマ
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlack,
          foregroundColor: primaryWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          textStyle: GoogleFonts.zenMaruGothic(
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
          ),
        ),
      ),

      // アイコンボタンのテーマ
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: darkGrey),
      ),

      // その他のテーマ設定
      scaffoldBackgroundColor: primaryWhite,
      dividerColor: lightGrey,
    );
  }
}
