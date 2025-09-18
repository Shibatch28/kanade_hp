import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
      child: Column(
        children: [
          // SNSリンク部分
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSocialLink(
                icon: Icons.music_note, // Twitter代替
                label: 'Petit four',
                url: 'https://x.com/petitfour309',
              ),
              const SizedBox(width: 20),
              _buildSocialLink(
                icon: Icons.people, // スタッフ
                label: '近藤 奏 X個人アカウント',
                url: 'https://x.com/immortal_dirt5',
              ),
              const SizedBox(width: 20),
              _buildSocialLink(
                icon: Icons.facebook,
                label: '近藤 奏 Facebook',
                url: 'https://www.facebook.com/profile.php?id=100032395710443',
              ),
              // const SizedBox(width: 20),
              // _buildSocialLink(
              //   icon: Icons.video_library, // YouTube
              //   label: 'official youtube channel',
              //   url: 'https://youtube.com/channel/official',
              // ),
            ],
          ),

          const SizedBox(height: 30),

          // コピーライト部分
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 左側のコピーライト
              Text(
                'Copyright(c) Kondo Kanade Official Website. All Rights Reserved.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),

              // 右側の装飾とロゴ
              Row(
                children: [
                  // ロゴ部分
                  Column(
                    children: [
                      // yanaginagi premium fanclub ロゴ
                      // Container(
                      //   padding: const EdgeInsets.all(8),
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         'yanaginagi',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.grey[700],
                      //         ),
                      //       ),
                      //       Text(
                      //         'premium fanclub',
                      //         style: TextStyle(
                      //           fontSize: 10,
                      //           color: Colors.grey[600],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLink({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
