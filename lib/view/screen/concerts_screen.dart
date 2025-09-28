import 'package:flutter/material.dart';
import 'package:kanade_hp/view/widget/concert_info.dart';
import "package:kanade_hp/view/widget/main_visual.dart";

class ConcertsScreen extends StatelessWidget {
  const ConcertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainVisual(title: 'コンサート情報', imageDirectory: 'concerts', height: 200),
        // コンサート情報
        ConcertInfo(
          title: '近藤奏 ピアノリサイタル「C」',
          date: '2025年10月4日(土)',
          time: '開場:13:20 開演:14:00',
          venue: '江崎ホール',
          address: '静岡市葵区七間町8-20　毎日江崎ビル9階',
          flyerImagePath: 'assets/concerts/flyer_c.jpg',
          programs: [
            ProgramItem(
              composer: 'ショパン',
              pieces: ['ピアノソナタ第3番 ロ短調 Op.58 第1楽章', 'ロンド 変ホ長調 Op.16'],
            ),
            ProgramItem(composer: 'ジョン・ケージ', pieces: ['4分33秒']),
            ProgramItem(composer: '千原英喜', pieces: ['雲丹長者の君の讃頌より']),
            ProgramItem(
              composer: '近藤奏',
              pieces: ['Don\'t call (現代ピアノという6つの電子楽器を用いて)'],
            ),
          ],
          ticketPrice: '全席 自由席 1200円',
          ticketInfo: 'チケットのお買い求めはチケットぴあをそのほかサプレイガイドをご利用ください。',
          ticketOptions: [
            'チケットぴあ（Pコード:307040）',
            'すみやグッディ本店（葵区呉服町）',
            'TEL:054-255-6722',
          ],
        ),
      ],
    );
  }
}
