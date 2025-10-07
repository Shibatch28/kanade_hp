import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanade_hp/theme/app_theme.dart';

/// 年表アイテムウィジェット
///
/// 使用例:
/// ```dart
/// ChronologyItem(
///   year: '2023',
///   month: '2',
///   day: '11',
///   title: 'ジョイントピアノリサイタル',
///   description: '静岡大学教育学部音楽科有志企画Vol.1を江崎ホールにて開催',
///   imagePath: 'assets/chronology/recital.jpg', // 画像がある場合
///   isLeft: true, // 左側に配置
///   showYear: true, // 年を表示するかどうか（デフォルト: true）
/// ),
///
/// ChronologyItem(
///   year: '2023', // 同じ年の場合
///   month: '7',
///   day: '1',
///   title: '別のイベント',
///   description: '同じ年の別のイベント',
///   isLeft: false,
///   showYear: false, // 年を非表示
/// ),
/// ```
///
/// パラメータ:
/// - [year]: 表示する年（必須）
/// - [month]: 月（空文字列可）
/// - [day]: 日（空文字列可）
/// - [title]: タイトル（必須）
/// - [description]: 説明文（null可）
/// - [imagePath]: 画像のパス（null可）
/// - [isLeft]: true=左側配置、false=右側配置
/// - [showYear]: 年を表示するかどうか（デフォルト: true）
class ChronologyItem extends StatelessWidget {
  final String year;
  final String month;
  final String day;
  final String title;
  final String? description;
  final String? imagePath;
  final bool isLeft;
  final bool showYear; // 年を表示するかどうか

  const ChronologyItem({
    super.key,
    required this.year,
    required this.month,
    required this.day,
    required this.title,
    this.description,
    this.imagePath,
    required this.isLeft,
    this.showYear = true, // デフォルトは表示
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          // 年と月日の表示
          if (showYear || month.isNotEmpty || day.isNotEmpty)
            _buildTimelineHeader(),

          const SizedBox(height: 15),

          // コンテンツ部分
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 左側エリア
                Expanded(
                  child:
                      isLeft
                          ? _buildTextContent() // テキストが左側
                          : (imagePath != null
                              ? _buildImageContent()
                              : const SizedBox()), // 画像が左側
                ),

                // 中央のタイムライン
                _buildTimelineBody(),

                // 右側エリア
                Expanded(
                  child:
                      isLeft
                          ? (imagePath != null
                              ? _buildImageContent()
                              : const SizedBox()) // 画像が右側
                          : _buildTextContent(), // テキストが右側
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// タイムラインのヘッダー（年と月日）を構築
  Widget _buildTimelineHeader() {
    return Column(
      children: [
        // 年表示（条件付き）
        if (showYear)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              year,
              style: GoogleFonts.notoSerifJp(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlack,
                letterSpacing: 2.0,
              ),
            ),
          ),

        // 年と月日の間隔
        if (showYear && (month.isNotEmpty || day.isNotEmpty))
          const SizedBox(height: 8),

        // 月日表示
        if (month.isNotEmpty || day.isNotEmpty)
          Text(
            '$month月$day日',
            style: GoogleFonts.notoSerifJp(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppTheme.darkGrey,
            ),
          ),
      ],
    );
  }

  /// タイムラインのボディ部分を構築
  Widget _buildTimelineBody() {
    return SizedBox(
      width: 220,
      child: Column(
        children: [
          // タイムラインの点
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlack,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),

          // タイムラインの線（コンテンツと同じ高さに拡張）
          Expanded(
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: AppTheme.mediumGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 画像コンテンツを構築
  Widget _buildImageContent() {
    return Padding(
      padding: EdgeInsets.only(
        left: isLeft ? 30 : 0, // 左側テキストの場合、画像は右側なので左マージン
        right: isLeft ? 0 : 30, // 右側テキストの場合、画像は左側なので右マージン
      ),
      child: Align(
        alignment:
            isLeft
                ? Alignment.centerLeft
                : Alignment.centerRight, // タイムライン側に寄せる
        child: SizedBox(
          width: 400,
          height: 600,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath!, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  /// テキストコンテンツを構築
  Widget _buildTextContent() {
    return Padding(
      padding: EdgeInsets.only(left: isLeft ? 0 : 30, right: isLeft ? 30 : 0),
      child: Column(
        crossAxisAlignment:
            isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // タイトル
          Text(
            title,
            style: GoogleFonts.notoSerifJp(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkGrey,
              letterSpacing: 1.0,
            ),
            textAlign: isLeft ? TextAlign.right : TextAlign.left,
          ),

          const SizedBox(height: 12),

          // 説明文
          if (description != null)
            Text(
              description!,
              style: GoogleFonts.notoSerifJp(
                fontSize: 15,
                height: 1.8,
                color: AppTheme.mediumGrey,
                letterSpacing: 0.5,
              ),
              textAlign: isLeft ? TextAlign.right : TextAlign.left,
            ),
        ],
      ),
    );
  }
}
