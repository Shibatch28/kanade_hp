import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
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
                          color: Colors.black.withOpacity(0.1),
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
                        style: GoogleFonts.notoSerifJp(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                          letterSpacing: 3.0,
                          height: 1.1,
                        ),
                      ),

                      const SizedBox(height: 50),

                      // プロフィール本文（Expandedを削除）
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
                        style: GoogleFonts.notoSerifJp(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF3A3A1A),
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
}
