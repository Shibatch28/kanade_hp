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
            title: 'お寺今世音(こんさあと)',
            date: '2025年12月5日(金)',
            time: '開場:15:00 開演:16:00',
            venue: '南叟寺',
            address: '静岡県静岡市葵区足久保口組 1579',
            flyerImagePath: 'assets/flyers/20251115a.jpg',
            programs: [
              ProgramItem(composer: 'ドビュッシー', pieces: ['映像第1集より「水の反映」']),
              ProgramItem(composer: 'サティ', pieces: ['ジムノペディ第1番']),
              ProgramItem(
                composer: '千原英喜',
                pieces: ['星月夜34の音の画集より「夕暮れ時は逢魔が時」'],
              ),
              ProgramItem(composer: 'ラヴェル', pieces: ['亡き王女のためのパヴァーヌ']),
              ProgramItem(composer: '南こうせつ', pieces: ['まごころに生きる']),
              ProgramItem(composer: 'カプースチン', pieces: ['演奏会用エチュード第3番トッカティーナ']),
              ProgramItem(
                composer: '吉松隆',
                pieces: ['プレイアデス舞曲集Ⅱより「鳥のいる間奏曲」', 'プレイアデス舞曲集Ⅴより「夕暮れのアラベスク」'],
              ),
              ProgramItem(composer: 'ドビュッシー', pieces: ['ベルガマスク組曲より「月の光」']),
              ProgramItem(
                composer: 'ムソルグスキー',
                pieces: ['展覧会の絵より「鶏の足の上に建っている小屋(バーバ・ヤガー)「キエフの大きな門」'],
              ),
            ],
            ticketPrice: '入場無料 要入場券 (未就学児入場可･無くなり次第終了となります)',
            ticketInfo: 'チケットの入手場所はこちらから:',
            ticketOptions: ['すみやグッディ本店 (呉服町)', 'Google Forms (当日受付にて入場券お渡し)'],
          ),
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
          const SizedBox(height: 30),
          const Text(
            '過去のコンサート',
            style: TextStyle(fontSize: 48),
            textAlign: TextAlign.center,
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
