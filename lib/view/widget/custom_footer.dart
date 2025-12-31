import 'package:flutter/material.dart';
import 'package:kanade_hp/models/consts.dart';
import 'package:kanade_hp/models/social_link.dart';
import 'package:kanade_hp/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

/// アプリケーションのフッターウィジェット。
///
/// SNSリンクと著作権情報を表示します。
class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 40,
        horizontal: isMobile ? 20 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SNSリンク部分
          _buildAllSocialLinks(isMobile),
          SizedBox(height: isMobile ? 20 : 30),
          // Copyright
          _buildCopyright(isMobile),
        ],
      ),
    );
  }

  /// 全てのSNSリンクを構築します。
  Widget _buildAllSocialLinks(bool isMobile) {
    if (isMobile) {
      // モバイル: 縦並び
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSocialLink(linkData: kanadeX),
          const SizedBox(height: 12),
          _buildSocialLink(linkData: kanadeFacebook),
          const SizedBox(height: 12),
          _buildSocialLink(linkData: petitFourSite),
          const SizedBox(height: 12),
          _buildSocialLink(linkData: petitFourX),
        ],
      );
    } else {
      // デスクトップ: 横並び (折り返し対応)
      return Wrap(
        spacing: 20,
        runSpacing: 12,
        children: [
          _buildSocialLink(linkData: kanadeX),
          _buildSocialLink(linkData: kanadeFacebook),
          _buildSocialLink(linkData: petitFourSite),
          _buildSocialLink(linkData: petitFourX),
        ],
      );
    }
  }

  /// SNSリンクのウィジェットを生成します。
  Widget _buildSocialLink({required SocialLink linkData}) {
    return GestureDetector(
      onTap: () => _launchUrl(linkData.url),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(linkData.icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              linkData.label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 著作権表示を構築します。
  Widget _buildCopyright(bool isMobile) {
    if (isMobile) {
      // モバイル：縦並び、小さいフォント
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Copyright(c) Kondo Kanade Official Website.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'All Rights Reserved.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
              letterSpacing: 0.3,
            ),
          ),
        ],
      );
    } else {
      // デスクトップ：横並び
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Copyright(c) Kondo Kanade Official Website. All Rights Reserved.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox.shrink(),
        ],
      );
    }
  }

  /// 指定されたURLをデフォルトのブラウザまたは適切なアプリケーションで開きます。
  ///
  /// このメソッドは、システムのデフォルトのURLスキームハンドラを使用して、
  /// 指定された[url]を開こうとします。URLを開けない場合は例外がスローされます。
  ///
  /// パラメータ:
  ///   - [url]: 開くURLの文字列。有効なURL形式である必要があります。
  ///
  /// 例外:
  ///   - [Exception]: システムがURLを開けない場合にスローされます。
  ///
  /// 使用例:
  /// ```dart
  /// await _launchUrl('https://www.example.com');
  /// ```
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception("Could bit launch $url");
    }
  }
}
