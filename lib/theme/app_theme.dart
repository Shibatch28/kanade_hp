import 'package:flutter/material.dart';

class AppTheme {
  // カラーパレット
  static const Color primaryBlack = Colors.black;
  static const Color primaryWhite = Colors.white;
  static const Color secondaryGrey = Colors.grey;
  static const Color darkGrey = Colors.black87;
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color mediumGrey = Color(0xFF9E9E9E);

  // ライトテーマ
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: primaryBlack,
        secondary: secondaryGrey,
        surface: primaryWhite,
        onSurface: darkGrey,
        onPrimary: primaryWhite,
        background: primaryWhite,
        onBackground: darkGrey,
      ),
      fontFamily: 'Noto Sans JP',

      // AppBarのテーマ
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryWhite,
        foregroundColor: darkGrey,
        elevation: 1,
        titleTextStyle: TextStyle(
          color: darkGrey,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),

      // ボタンのテーマ
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlack,
          foregroundColor: primaryWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),

      // アイコンボタンのテーマ
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: darkGrey),
      ),

      // テキストテーマ
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: darkGrey,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: darkGrey,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: darkGrey, fontSize: 16, height: 1.6),
        bodyMedium: TextStyle(color: mediumGrey, fontSize: 14, height: 1.6),
      ),

      // その他のテーマ設定
      scaffoldBackgroundColor: primaryWhite,
      dividerColor: lightGrey,
    );
  }

  // ダークテーマ（将来的に使用する場合）
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: primaryWhite,
        secondary: mediumGrey,
        surface: primaryBlack,
        onSurface: primaryWhite,
        onPrimary: primaryBlack,
      ),
      fontFamily: 'Noto Sans JP',
      // ダークテーマの詳細設定...
    );
  }
}
