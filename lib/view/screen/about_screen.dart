import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanade_hp/view/widget/chronology_item.dart';
import 'package:kanade_hp/view/widget/main_visual.dart';

/// プロフィール画面（足跡）を表示するウィジェット。
///
/// メインビジュアルと年表セクションを含みます。
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // プロフィールセクション
        // _buildProfileSection(),
        MainVisual(
          title: "足跡 (プロフィール)",
          imageDirectory: "vis_about",
          height: 300,
        ),
        // 年表セクション
        _buildChronologySection(),
      ],
    );
  }

  // ignore: unused_element
  Widget _buildProfileSection() {
    return Container(
      color: const Color(0xFFFAFAFA), // 既存テーマに合わせる
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 左側の写真エリア
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRect(
                      child: Image.asset(
                        'assets/kanade_kari.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 80),

                // 右側のテキストエリア
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // タイトル
                      Text(
                        '近藤 奏',
                        style: GoogleFonts.notoSansJp(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                          letterSpacing: 3.0,
                          height: 1.1,
                        ),
                      ),

                      const SizedBox(height: 50),

                      // プロフィール本文
                      Text(
                        '長野県長野市出身。長野日本大学高等学校卒。ピアノを青木かおり、小山香織、後藤友香理の各氏に師事。静岡アンサンブル同好会代表。静岡大学教育学部音楽教育専修4年。サンマルクカフェ静岡伊勢丹前店専属ピアニスト。\n\n'
                        '2017年 第27回日本クラシック音楽コンクール 全国大会第5位。\n\n'
                        '2021年 第15回ベーテン音楽コンクール全国大会第1位。翌年に開催されたガラコンサートに出演。\n\n'
                        '2022年 音楽活動が評価され、2021年静岡大学学長表彰を受賞。\n\n'
                        '2023年2月11日に静岡大学教育学部音楽科有志企画Vol.1「近藤奏 上中友貴 ジョイントピアノリサイタル」を江崎ホールにて開催。\n\n'
                        '2023年7月1日に開催された静岡大学管弦楽団第109回定期演奏会にてソリストを務め、グリーグ/ピアノ協奏曲イ短調Op.16を演奏。\n\n'
                        '2023年8月8日に静岡大学教育学部音楽科有志企画Vol.2「クラシックでみる幻想」をしずぎんホールユーフォニアにて開催。\n\n'
                        '2023年 ベルリン・フィルハーモニー管弦楽団 楽団主催"Be Phil Orchestra"のメンバーとして、11月26日に東京・サントリーホールにて開催されたBe Philオーケストラジャパン 公演に出演。\n\n'
                        '2024年4月6日に静岡大学教育学部音楽科有志企画Vol.3「音⊃音楽 空気⊃私」を静岡音楽館AOIにて開催。',
                        style: GoogleFonts.notoSansJp(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF3A3A3A), // 既存テーマの色に統一
                          letterSpacing: 1.0,
                          height: 2.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 年表セクションを構築します。
  Widget _buildChronologySection() {
    return Container(
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          // 年表アイテム
          const ChronologyItem(
            year: '2002',
            month: '10',
            day: '31',
            title: '多分諏訪の病院で生まれる。',
            description:
                '産声を聞いた兄はその場で「カエルさんみたい!!」と。このため近藤奏の口はカエルのようなアヒルのような口っぽくなったと言われている。',
            imagePath: 'assets/chronology/20021031.jpg',
            isLeft: true,
            showYear: true,
          ),

          const ChronologyItem(
            year: '小学生くらい',
            month: '',
            day: '',
            title: '野球とかピアノとか水泳とか始める。順序は知らない。',
            description: '',
            isLeft: false,
            showYear: true,
          ),

          const ChronologyItem(
            year: '2016',
            month: '',
            day: '',
            title: '三陽中学校で生徒会選挙にて全校生徒の前で「この三陽中学校を変えてみせます！」とマイクなしで豪語。',
            description: '本当に恥ずかしい。結果副会長・文化祭実行委員長当選。',
            isLeft: false,
            showYear: true,
          ),

          const ChronologyItem(
            year: '2017',
            month: '',
            day: '',
            title: '大会の決勝でエラーをしてサヨナラ負けをする。',
            description:
                '「お前のせいで負けた」と何度も言われたことが結構なトラウマであるが、その時にずっと黙って横にいてくれた仲間はまぢでいいやつ。全人類に紹介したいいいやつ。',
            isLeft: true,
            showYear: true,
          ),

          const ChronologyItem(
            year: '',
            month: '',
            day: '',
            title: '日本クラシック音楽コンクールで第5位入賞。',
            description: 'この時の演奏はゾーンに入っていた自信がある。',
            isLeft: false,
            showYear: false,
          ),

          const ChronologyItem(
            year: '2018',
            month: '',
            day: '',
            title: '高校受験を失敗し併願校へ。いろいろ気分もナイーブで気乗りせず、野球部に入らずになぜか吹奏楽部に入る。',
            description:
                '打楽器をやりたかったが「夏までクラリネットをやって欲しい」と言われ、結果3年間引退までクラリネット。昨今このような手口で不足しているパートを埋める団体が増えている。非常に悪質である。',
            isLeft: false,
            showYear: true,
          ),

          const ChronologyItem(
            year: '2021',
            month: '',
            day: '',
            title: '静岡大学へ入学。',
            description:
                '入試ではなぜ静岡大学に入りたかったのか志望動機を雄弁に語ったが、結局のところ一人暮らしをしたいからであった。',
            isLeft: true,
            showYear: true,
          ),

          const ChronologyItem(
            year: '',
            month: '',
            day: '',
            title: '多分アルバイトに6回くらい落ちて、最終的にチャリで40分くらいのコンビニで雇われる。',
            description: '',
            isLeft: false,
            showYear: false, // 同じ年なので非表示
          ),

          const ChronologyItem(
            year: '2021',
            month: '10',
            day: 'のある',
            title: '静岡アンサンブル同好会(アンドウ)を仲間と共に始める。',
            description: 'あの頃の無敵感、半端ない。',
            isLeft: true,
            showYear: false, // 同じ年なので非表示
          ),

          const ChronologyItem(
            year: '2026',
            month: '3',
            day: '31',
            title: '卒業予定。',
            description: 'なお、静岡大学は４年制大学である。',
            isLeft: false,
            showYear: true, // 同じ年なので非表示
          ),
        ],
      ),
    );
  }
}
