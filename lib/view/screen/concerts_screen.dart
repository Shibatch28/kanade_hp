import 'package:flutter/material.dart';
import 'package:kanade_hp/view/widget/concert_info.dart';
import "package:kanade_hp/view/widget/main_visual.dart";

/// 演奏会情報画面を表示するウィジェット。
///
/// 今後の演奏会と過去の演奏会情報を表示します。
class ConcertsScreen extends StatelessWidget {
  const ConcertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainVisual(title: 'コンサート情報', imageDirectory: 'concerts', height: 200),
          ConcertInfo(
            title: '近藤奏ピアノリサイタル',
            date: '2026年08月22日 (土)',
            time: '開場: 13:30 開演: 14:00',
            venue: '熱海 起雲閣 音楽サロン',
            address: '〒413-0022 静岡県熱海市昭和町 4-2',
            programs: [
              ProgramItem(composer: 'ショパン', pieces: ['ショパン', '作品名', 'バラード第 1 番ト短調 作品 23']),
              ProgramItem(
                composer: 'ベートーヴェン',
                pieces: ['ベートーヴェン', '作品名', 'ピアノソナタ第 7 番 イ⻑調 作品 10-3'],
              ),
              ProgramItem(
                composer: 'ブルグミュラー',
                pieces: ['ブルグミュラー', '作品名', '25 の練習曲より「すなおな⼼」「アラベスク」「パストラル(牧歌)」'],
              ),
              ProgramItem(
                composer: 'ブラームス',
                pieces: ['ブラームス', '作品名', '２つのラプソディより第 1 番 ロ短調 作品 79-1'],
              ),
              ProgramItem(
                composer: 'リスト',
                pieces: ['リスト', '作品名', '村の居酒屋での踊り(メフィストワルツ第 1 番) S.514'],
              ),
              ProgramItem(composer: 'ドビュッシー', pieces: ['ドビュッシー', '作品名', '喜びの島']),
            ],
            ticketPrice: '一般 2,200円 U23 1,200円 ⾼校⽣以下無料\n未就学児童⼊場可\n⾞椅⼦席あり',
            ticketInfo: 'チケットぴあ\nすみやグッディ本店',
            ticketOptions: [
              'チケットぴあ\nhttps://t.pia.jp/pia/artist/artists.do?artistsCd=O7040029',
              'すみやグッディ本店\nTEL：054-253-6222【11:00~19:00/⽔曜⽇定休】',
            ],
            additionalInfo: '高校生以下無料のチケットはすみやグッディでお買い求め頂くか、主催者に直接お問い合わせください。',
          ),
          ConcertInfo(
            title: '近藤奏ピアノリサイタル',
            date: '2026年08月29日 (土)',
            time: '開場: 13:30 開演: 14:00',
            venue: 'カワイ浜松コンサートサロン ブリエ',
            address: '〒430-0926 静岡県浜松市中央区砂⼭町 355 番地の 4(ハマキョウレックス浜松駅南ビル 1F)',
            programs: [
              ProgramItem(composer: 'ショパン', pieces: ['ショパン', '作品名', 'バラード第 1 番ト短調 作品 23']),
              ProgramItem(
                composer: 'ベートーヴェン',
                pieces: ['ベートーヴェン', '作品名', 'ピアノソナタ第 7 番 イ⻑調 作品 10-3'],
              ),
              ProgramItem(
                composer: 'ブルグミュラー',
                pieces: ['ブルグミュラー', '作品名', '25 の練習曲より「すなおな⼼」「アラベスク」「パストラル(牧歌)」'],
              ),
              ProgramItem(
                composer: 'ブラームス',
                pieces: ['ブラームス', '作品名', '２つのラプソディより第 1 番 ロ短調 作品 79-1'],
              ),
              ProgramItem(
                composer: 'リスト',
                pieces: ['リスト', '作品名', '村の居酒屋での踊り(メフィストワルツ第 1 番) S.514'],
              ),
              ProgramItem(composer: 'ドビュッシー', pieces: ['ドビュッシー', '作品名', '喜びの島']),
            ],
            ticketPrice: '一般 2,200円 U23 1,200円 ⾼校⽣以下無料\n未就学児童⼊場可\n⾞椅⼦席あり',
            ticketInfo: 'チケットぴあ\nすみやグッディ本店\nアクトシティ浜松チケットセンター(浜松公演のみ)\nHCF オンラインショップ(浜松公演のみ)',
            ticketOptions: [
              'チケットぴあ\nhttps://t.pia.jp/pia/artist/artists.do?artistsCd=O7040029',
              'すみやグッディ本店\nTEL：054-253-6222【11:00~19:00/⽔曜⽇定休】\nアクトシティ浜松チケットセンター(浜松公演のみ)\n（店頭販売のみ／10：00〜19：00）\nHCF オンラインショップ(浜松公演のみ)\nhttps://www.hcf.or.jp/shop/index.php',
            ],
            additionalInfo: '高校生以下無料のチケットはすみやグッディでお買い求め頂くか、主催者に直接お問い合わせください。',
          ),
          ConcertInfo(
            title: '近藤奏ピアノリサイタル',
            date: '2026年09月05日 (土)',
            time: '開場: 13:30 開演: 14:00',
            venue: '札の辻クロスホール',
            address: '〒420-0031 静岡市葵区呉服町 1 丁⽬ 30 札の辻クロス 6 階',
            programs: [
              ProgramItem(composer: 'ショパン', pieces: ['ショパン', '作品名', 'バラード第 1 番ト短調 作品 23']),
              ProgramItem(
                composer: 'ベートーヴェン',
                pieces: ['ベートーヴェン', '作品名', 'ピアノソナタ第 7 番 イ⻑調 作品 10-3'],
              ),
              ProgramItem(
                composer: 'ブルグミュラー',
                pieces: ['ブルグミュラー', '作品名', '25 の練習曲より「すなおな⼼」「アラベスク」「パストラル(牧歌)」'],
              ),
              ProgramItem(
                composer: 'ブラームス',
                pieces: ['ブラームス', '作品名', '２つのラプソディより第 1 番 ロ短調 作品 79-1'],
              ),
              ProgramItem(
                composer: 'リスト',
                pieces: ['リスト', '作品名', '村の居酒屋での踊り(メフィストワルツ第 1 番) S.514'],
              ),
              ProgramItem(composer: 'ドビュッシー', pieces: ['ドビュッシー', '作品名', '喜びの島']),
            ],
            ticketPrice: '一般 2,200円 U23 1,200円 ⾼校⽣以下無料\n未就学児童⼊場可\n⾞椅⼦席あり',
            ticketInfo: 'チケットぴあ\nすみやグッディ本店',
            ticketOptions: [
              'チケットぴあ\nhttps://t.pia.jp/pia/artist/artists.do?artistsCd=O7040029',
              'すみやグッディ本店\nTEL：054-253-6222【11:00~19:00/⽔曜⽇定休】',
            ],
            additionalInfo: '高校生以下無料のチケットはすみやグッディでお買い求め頂くか、主催者に直接お問い合わせください。',
          ),
          const SizedBox(height: 30),
          const Text('過去のコンサート', style: TextStyle(fontSize: 48), textAlign: TextAlign.center),
          ConcertInfo(
            title: 'お寺今世音(こんさあと)',
            date: '2025年11月15日 (金)',
            time: '開場:15:00 開演:16:00',
            venue: '南叟寺',
            address: '静岡県静岡市葵区足久保口組 1579',
            flyerImagePaths: const ['assets/flyers/20251115a.jpg', 'assets/flyers/20251115b.jpg'],
            programs: [
              ProgramItem(composer: 'ドビュッシー', pieces: ['映像第1集より「水の反映」']),
              ProgramItem(composer: 'サティ', pieces: ['ジムノペディ第1番']),
              ProgramItem(composer: '千原英喜', pieces: ['星月夜34の音の画集より「夕暮れ時は逢魔が時」']),
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
            title: '近藤奏 ピアノリサイタル「C」',
            date: '2025年10月4日 (土)',
            time: '開場:13:20 開演:14:00',
            venue: '江崎ホール',
            address: '静岡市葵区七間町8-20 毎日江崎ビル9階',
            flyerImagePaths: const ['assets/flyers/flyer_C.png'],
            programs: [
              ProgramItem(composer: 'ショパン', pieces: ['ピアノソナタ第3番 ロ短調 Op.58 第1楽章', 'ロンド 変ホ長調 Op.16']),
              ProgramItem(composer: 'ジョン・ケージ', pieces: ['4分33秒']),
              ProgramItem(composer: '千原英喜', pieces: ['雲丹長者の君の讃頌より']),
              ProgramItem(composer: '近藤奏', pieces: ['Don\'t call (現代ピアノという6つの電子楽器を用いて)']),
            ],
            ticketPrice: '全席 自由席 1200円',
            ticketInfo: 'チケットのお買い求めはチケットぴあをそのほかプレイガイドをご利用ください。',
            ticketOptions: ['チケットぴあ（Pコード:307040）', 'すみやグッディ本店（葵区呉服町）', 'TEL:054-255-6722'],
          ),
          ConcertInfo(
            title: '近藤奏ピアノリサイタル D',
            date: '2026年1月24日 (土)',
            time: '開場:13:20 開演:14:00',
            venue: '江﨑ホール',
            address: '静岡市葵区七間町8-20 毎日江﨑ビル9階',
            flyerImagePaths: const ['assets/flyers/20260124a.png', 'assets/flyers/20260124b.png'],
            programs: [
              ProgramItem(composer: 'セルゲイ･プロコフィエフ', pieces: ['ピアノソナタ第6番 作品82', 'ピアノソナタ第8番 作品84']),
            ],
            ticketPrice: '全席 自由席 1,200円',
            ticketInfo: 'チケットのお買い求めはチケットぴあをご利用ください。',
            ticketOptions: ['チケットぴあ (P コード: 317675)'],
          ),
          ConcertInfo(
            title: 'シバリスク & 近藤奏 Live',
            date: '2026年2月4日 (水)',
            time: '開場:18:30 開演:19:00',
            venue: '吉祥寺alaise',
            address: '吉祥寺武蔵野市吉祥寺南町1-6-3 吉祥寺東急REIホテル地下1F',
            flyerImagePaths: ['assets/flyers/20260204.jpg'],
            programs: [],
            ticketPrice: '全席 自由席 2,000円',
            ticketInfo: 'Google Formsから予約 (当日会場にて支払い)',
            ticketOptions: [
              '[予約フォームはこちらから](https://docs.google.com/forms/d/e/1FAIpQLScbhYDBwNYgywEl8AVzW3neUulhiERcSE48Yz9d5Yd3D42slw/viewform)',
            ],
          ),
          ConcertInfo(
            title: 'お寺今世音 (おてらこんさあと)',
            date: '2026年3月1日 (日)',
            time: '開場:14:00 開演:15:00',
            venue: '南叟寺',
            address: '静岡県静岡市葵区足久保口組1579',
            flyerImagePaths: ['assets/flyers/20260301.png'],
            programs: [
              ProgramItem(composer: 'ショパン', pieces: ['バラード 第2番']),
              ProgramItem(composer: '南こうせつ', pieces: ['まごころに生きる']),
              ProgramItem(composer: 'ヨハン･シュトラウス2世', pieces: ['こうもり']),
              ProgramItem(composer: 'ベートーヴェン', pieces: ['ピアノソナタ第 14番「月光」嬰ハ短調 作品 27-2']),
              ProgramItem(composer: 'シベリウス', pieces: ['樹の組曲']),
            ],
            ticketPrice: 'チケット無料',
            ticketInfo: '全席自由席',
            ticketOptions: [
              '[Google フォーム](https://docs.google.com/forms/d/e/1FAIpQLSdUAWp2dZ2Tb5BD2PsV8e5BUqOkuQd2YtroMf-pmSeuoxl7ng/viewform?usp=dialog) よりお問い合わせください。',
            ],
          ),
          ConcertInfo(
            title: '木内伶奈×近藤奏 ピアノデュオリサイタル',
            date: '2026年3月7日 (土)',
            time: '開場:14:00 開演:14:30',
            venue: '長野県佐久平交流センター',
            address: '長野県佐久市佐久平駅南4-1',
            flyerImagePaths: ['assets/flyers/20260307a.jpg', 'assets/flyers/20260307b.jpg'],
            programs: [
              ProgramItem(composer: 'ショパン', pieces: ['スケルツォ第1番 Op.20']),
              ProgramItem(composer: 'ブラームス', pieces: ['6つの小品 Op.118']),
              ProgramItem(composer: 'カプースチン', pieces: ['シンフォニエッタ Op.49']),
            ],
            ticketPrice: '一般 2,500円 / 高校生以下 1,000円',
            ticketInfo: 'Google フォームにてお問い合わせください。',
            ticketOptions: [
              '[Google フォーム](https://docs.google.com/forms/d/e/1FAIpQLSdx9yYdpqWf530hHoCXGttBW-YZyLSABzLSc8ZdH_z6EC7RBQ/viewform)',
            ],
          ),
          ConcertInfo(
            title: '近藤奏 ピアノリサイタル',
            date: '2026年3月13日 (金)',
            time: '開場:18:15 開演:19:00',
            venue: '下北沢アレイホール',
            address: '東京都世田谷区北沢2丁目24-8 下北沢アレイ 3F',
            flyerImagePaths: const ['assets/flyers/20260313a.jpeg', 'assets/flyers/20260313b.jpeg'],
            programs: [
              ProgramItem(
                composer: 'ベートーヴェン',
                pieces: ['交響曲第7番イ長調 作品92 第1, 2楽章 (リスト編曲)', 'ピアノソナタ第 14番「月光」嬰ハ短調 作品 27-2'],
              ),
              ProgramItem(composer: 'ショパン', pieces: ['スケルツォ第1番 ロ短調 作品 20']),
              ProgramItem(composer: 'ビル・エヴァンス', pieces: ['ワルツ･フォー･デビィ']),
              ProgramItem(composer: 'カプースチン', pieces: ['ブラジルの水彩画パラフレーズ']),
            ],
            ticketPrice: '全席 自由席 2,500円',
            ticketInfo: 'チケットのお買い求めはチケットぴあをご利用ください。',
            ticketOptions: [
              '[チケットぴあ（Pコード:311308）](https://t.pia.jp/pia/event/event.do?eventCd=2602608)',
            ],
          ),
          ConcertInfo(
            title: 'サンマルクカフェ モーニングピアノコンサート vol.47',
            date: '2026年3月15日 (日)',
            time: '開演:10:30',
            venue: 'サンマルクカフェ静岡伊勢丹前店',
            address: '静岡市葵区呉服町1-30 札の辻クロスビル',
            flyerImagePaths: ['assets/flyers/20260315.jpg'],
            programs: [
              ProgramItem(composer: 'ビル・エヴァンス', pieces: ['ワルツ･フォー･デビィ']),
              ProgramItem(composer: 'ヨハン･シュトラウス2世', pieces: ['こうもり']),
              ProgramItem(composer: 'セルゲイ･ラフマニノフ', pieces: ['パガニーニの主題による狂詩曲より 第18変奏']),
              ProgramItem(composer: 'ショパン', pieces: ['子犬のワルツ']),
              ProgramItem(composer: 'サザン・オールスターズ', pieces: ['HOTEL PACIFIC']),
              ProgramItem(composer: 'Tempalay', pieces: ['美しい']),
            ],
            ticketPrice: 'チケット不要',
            ticketInfo: '全席 自由席',
            ticketOptions: ['店頭にてワンドリンクご注文ください。'],
          ),
          ConcertInfo(
            title: '創業100周年記念 第4回はあといん魚勝コンサート',
            date: '2026年3月14日 (土), 2026年3月22日(土)',
            time: '開場:11:00 開演:11:30',
            venue: 'はあといん魚勝',
            address: '静岡市葵区方羽町53',
            flyerImagePaths: ['assets/flyers/20260314.png'],
            programs: [],
            ticketPrice: '5,000円 (食事･ワンドリンク付き)',
            ticketInfo: 'チケットのお買い求めははあといん魚勝様にお問い合わせください。',
            ticketOptions: ['TEL: 054-271-3777'],
          ),
          ConcertInfo(
            title: '近藤奏ピアノリサイタル E',
            date: '2026年4月4日 (土)',
            time: '開場:13:20 開演:14:00',
            venue: '江﨑ホール',
            address: '静岡市葵区七間町8-20 毎日江﨑ビル9階',
            flyerImagePaths: const ['assets/flyers/20260404a.png', 'assets/flyers/20260404b.png'],
            programs: [
              ProgramItem(composer: '近藤奏', pieces: ['やさしいせかいmodul (現代ピアノと電子機器と...を用いた全50分の作品)']),
            ],
            ticketPrice: '全席 自由席 1,200円',
            ticketInfo: 'チケットのお買い求めはチケットぴあ、またはすみやグッディをご利用ください。',
            ticketOptions: [
              '[チケットぴあ (P コード: 317676)](https://t.pia.jp/pia/event/event.do?eventCd=2548828)',
              'すみやグッディ 本店（呉服町）\nTEL : 054-253-6222\n【11:00~19:00/水曜日定休】',
            ],
            additionalInfo: 'Guest: 松木絵里花 (Ba.)',
          ),
          ConcertInfo(
            title: '第16回 菩提樹院花祭り 法要・コンサート',
            date: '2026年04月12日 (日)',
            time: '開演: 13:00',
            venue: '菩提樹院',
            address: '〒420-0816 静岡県静岡市葵区沓谷 1344-4',
            programs: [],
            ticketPrice: '全席自由 1,000円(小学生以下無料)',
            ticketInfo: '菩提樹院',
            ticketOptions: ['054-261-3272'],
            additionalInfo: '共演 Vo.武中千恵 Perc.長岡敬二郎 Gt.進藤洋樹',
          ),
        ],
      ),
    );
  }
}
