import 'package:flutter/material.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/utils/responsive.dart';

class ChronologyItem extends StatelessWidget {
  final String year;
  final String month;
  final String day;
  final String title;
  final String? description;
  final String? imagePath;
  final bool isLeft;
  final bool showYear;

  const ChronologyItem({
    super.key,
    required this.year,
    required this.month,
    required this.day,
    required this.title,
    this.description,
    this.imagePath,
    required this.isLeft,
    this.showYear = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    if (isMobile) {
      return _buildModileLayout(context, isMobile);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildModileLayout(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showYear || month.isNotEmpty || day.isNotEmpty)
          _buildTimelineHeader(context),
        if (imagePath != null) _buildImageContent(isMobile),
        _buildTextContent(context, isMobile),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          // 年と月日の表示
          if (showYear || month.isNotEmpty || day.isNotEmpty)
            _buildTimelineHeader(context),

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
                          ? _buildTextContent(context, false) // テキストが左側
                          : (imagePath != null
                              ? _buildImageContent(Responsive.isMobile(context))
                              : const SizedBox()), // 画像が左側
                ),

                // 中央のタイムライン
                _buildTimelineBody(),

                // 右側エリア
                Expanded(
                  child:
                      isLeft
                          ? (imagePath != null
                              ? _buildImageContent(Responsive.isMobile(context))
                              : const SizedBox()) // 画像が右側
                          : _buildTextContent(context, false), // テキストが右側
                ),
              ],
            ),
          ),
        ],
      ),
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

  /// タイムラインのヘッダ (年と月日) を構築
  Widget _buildTimelineHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showYear)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              year,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: Responsive.isMobile(context) ? 48 : 48,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ),

        // 月日表示
        if (month.isNotEmpty || day.isNotEmpty)
          Text(
            "$month月$day日",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppTheme.darkGrey,
            ),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 2),
      ],
    );
  }

  /// 画像コンテンツを構築
  Widget _buildImageContent(bool isMobile) {
    return Padding(
      padding:
          isMobile
              ? EdgeInsets.zero
              : EdgeInsets.only(
                left: isLeft ? 30 : 0, // 左側テキストの場合、画像は右側なので左マージン
                right: isLeft ? 0 : 30, // 右側テキストの場合、画像は左側なので右マージン
              ),
      child: Align(
        alignment:
            isMobile
                ? Alignment.center
                : isLeft
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
  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Padding(
      padding:
          isMobile
              ? EdgeInsets.zero
              : EdgeInsets.only(left: isLeft ? 0 : 30, right: isLeft ? 30 : 0),
      child: Column(
        crossAxisAlignment:
            isMobile
                ? CrossAxisAlignment.center
                : isLeft
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
        children: [
          // タイトル
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppTheme.charcoal,
            ),
            textAlign:
                isMobile
                    ? TextAlign.center
                    : (isLeft ? TextAlign.right : TextAlign.left),
          ),

          const SizedBox(height: 12),

          // 説明文
          if (description != null)
            Text(
              description!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppTheme.darkGrey),
              textAlign:
                  isMobile
                      ? TextAlign.center
                      : (isLeft ? TextAlign.right : TextAlign.left),
            ),
        ],
      ),
    );
  }
}
