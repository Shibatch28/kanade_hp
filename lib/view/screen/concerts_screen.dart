import 'package:flutter/material.dart';
import 'package:kanade_hp/view/widget/concert_info.dart';
import "package:kanade_hp/view/widget/main_visual.dart";

class ConcertsScreen extends StatelessWidget {
  const ConcertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainVisual(title: 'コンサート情報', imageDirectory: 'concerts', height: 200),
          ConcertInfo(
            title: '近藤奏 ピアノリサイタル',
            date: '2025年12月5日(金)',
            time: '開場:18:15 開演:19:00',
            venue: '下北沢アレイホール',
            address: '東京都世田谷区北沢2丁目24-8 下北沢アレイ 3F',
            flyerImagePath: 'assets/flyers/20251205a.jpeg',
            programs: [
              ProgramItem(
                composer: 'ベートーヴェン',
                pieces: [
                  '交響曲第7番イ長調 作品92 第1, 2楽章 (リスト編曲)',
                  'ピアノソナタ第 14番「月光」嬰ハ短調作品 27-2',
                ],
              ),
              ProgramItem(composer: 'ショパン', pieces: ['ワルツ・フォー・デビィ']),
              ProgramItem(composer: 'カプースチン', pieces: ['ブラジルの水彩画パラフレーズ']),
            ],
            ticketPrice: '全席 自由席 2,500円',
            ticketInfo: 'チケットのお買い求めはチケットぴあをご利用ください。',
            ticketOptions: ['チケットぴあ（Pコード:311308）'],
          ),
          ConcertInfo(
            title: '近藤奏 ピアノリサイタル「C」',
            date: '2025年10月4日(土)',
            time: '開場:13:20 開演:14:00',
            venue: '江崎ホール',
            address: '静岡市葵区七間町8-20 毎日江崎ビル9階',
            flyerImagePath: 'assets/flyers/flyer_C.png',
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
            ticketInfo: 'チケットのお買い求めはチケットぴあをそのほかプレイガイドをご利用ください。',
            ticketOptions: [
              'チケットぴあ（Pコード:307040）',
              'すみやグッディ本店（葵区呉服町）',
              'TEL:054-255-6722',
            ],
          ),
        ],
      ),
    );
  }
}
