import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanade_hp/theme/app_theme.dart';

/// コンサート情報表示ウィジェット
///
/// 使用例:
/// ```dart
/// ConcertInfo(
///   title: '近藤奏 ピアノリサイタル「C」',
///   date: '2025年10月4日(土)',
///   time: '開場:13:20 開演:14:00',
///   venue: '江崎ホール',
///   address: '静岡市葵区七間町8-20　毎日江崎ビル9階',
///   flyerImagePath: 'assets/concerts/flyer_c.jpg',
///   programs: [
///     ProgramItem(composer: 'ショパン', pieces: [
///       'ピアノソナタ第3番 ロ短調 Op.58 第1楽章',
///       'ロンド 変ホ長調 Op.16',
///     ]),
///     ProgramItem(composer: 'ジョン・ケージ', pieces: ['4分33秒']),
///     ProgramItem(composer: '千原英喜', pieces: ['雲丹長者の君の讃頌より']),
///     ProgramItem(composer: '近藤奏', pieces: [
///       'Don\'t call (現代ピアノという6つの電子楽器を用いて)',
///     ]),
///   ],
///   ticketPrice: '全席 自由席 1200円',
///   ticketInfo: 'チケットのお買い求めはチケットぴあをそのほかサプレイガイドをご利用ください。',
///   ticketOptions: [
///     'チケットぴあ（Pコード:307040）',
///     'すみやグッティ本店（葵区呉服町）',
///     'TEL:054-255-6722',
///   ],
/// ),
/// ```
class ConcertInfo extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String address;
  final String? flyerImagePath;
  final List<ProgramItem> programs;
  final String ticketPrice;
  final String ticketInfo;
  final List<String> ticketOptions;

  const ConcertInfo({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.address,
    this.flyerImagePath,
    required this.programs,
    required this.ticketPrice,
    required this.ticketInfo,
    required this.ticketOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryWhite,
      padding: const EdgeInsets.all(40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // コンサートタイトル
              _buildTitle(),

              const SizedBox(height: 40),

              // メインコンテンツ（チラシ画像と詳細情報）
              _buildMainContent(),

              const SizedBox(height: 40),

              // プログラム情報
              _buildProgramSection(),

              const SizedBox(height: 40),

              // チケット情報
              _buildTicketSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.notoSerifJp(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryBlack,
          letterSpacing: 2.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左側：チラシ画像 (5割)
        Expanded(
          flex: 5,
          child:
              flyerImagePath != null
                  ? Container(
                    alignment: Alignment.center,
                    child: Image.asset(flyerImagePath!, fit: BoxFit.contain),
                  )
                  : Container(), // 画像がない場合は空のContainer
        ),

        const SizedBox(width: 40),

        // 右側：日時・場所情報 (5割)
        Expanded(flex: 5, child: _buildEventDetails()),
      ],
    );
  }

  Widget _buildEventDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 日時・場所セクションタイトル
        Text(
          '日時・場所',
          style: GoogleFonts.notoSerifJp(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlack,
            letterSpacing: 1.0,
          ),
        ),

        const SizedBox(height: 20),

        // 日時
        Text(
          '$date　$time',
          style: GoogleFonts.notoSerifJp(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkGrey,
          ),
        ),

        const SizedBox(height: 10),

        // 会場名
        Text(
          venue,
          style: GoogleFonts.notoSerifJp(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkGrey,
          ),
        ),

        const SizedBox(height: 5),

        // 住所
        Text(
          address,
          style: GoogleFonts.notoSerifJp(
            fontSize: 14,
            color: AppTheme.mediumGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildProgramSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // プログラムセクションタイトル
        Text(
          'プログラム',
          style: GoogleFonts.notoSerifJp(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlack,
            letterSpacing: 1.0,
          ),
        ),

        const SizedBox(height: 20),

        // プログラム一覧
        ...programs.map((program) => _buildProgramItem(program)),
      ],
    );
  }

  Widget _buildProgramItem(ProgramItem program) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 作曲家名
          Text(
            program.composer,
            style: GoogleFonts.notoSerifJp(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkGrey,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 8),

          // 楽曲一覧
          ...program.pieces.map(
            (piece) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: GoogleFonts.notoSerifJp(
                      fontSize: 16,
                      color: AppTheme.mediumGrey,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      piece,
                      style: GoogleFonts.notoSerifJp(
                        fontSize: 16,
                        color: AppTheme.mediumGrey,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // チケット取り扱いセクションタイトル
        Text(
          'チケット取り扱い',
          style: GoogleFonts.notoSerifJp(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlack,
            letterSpacing: 1.0,
          ),
        ),

        const SizedBox(height: 20),

        // チケット料金
        Text(
          ticketPrice,
          style: GoogleFonts.notoSerifJp(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkGrey,
          ),
        ),

        const SizedBox(height: 12),

        // チケット情報
        Text(
          ticketInfo,
          style: GoogleFonts.notoSerifJp(
            fontSize: 14,
            color: AppTheme.mediumGrey,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 16),

        // チケット取り扱い先
        ...ticketOptions.map(
          (option) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.mediumGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  option,
                  style: GoogleFonts.notoSerifJp(
                    fontSize: 14,
                    color: AppTheme.mediumGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// プログラム項目クラス
class ProgramItem {
  final String composer;
  final List<String> pieces;

  const ProgramItem({required this.composer, required this.pieces});
}
