import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/view/widget/main_visual.dart';

/// お問い合わせ画面を表示するウィジェット。
///
/// メールでのお問い合わせ情報を提供します。
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // メインビジュアル（小さめ）
        const MainVisual(
          title: 'お問い合わせ',
          imageDirectory: 'vis_contact',
          height: 300,
        ),

        // コンタクトコンテンツ
        Container(
          color: AppTheme.primaryWhite,
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // メールでのお問い合わせセクション
                  _buildEmailSection(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// メールでのお問い合わせセクションを構築します。
  Widget _buildEmailSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // セクションタイトル
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppTheme.primaryBlack,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'メールでのお問い合わせ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // 説明文1
        Text(
          'メールでのお問い合わせは下記よりお願い致します。',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.darkGrey,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 8),

        // 説明文2
        Text(
          'お急ぎいただきましたメールへのご返信にお時間を頂戴する場合や、ご返信できかねる場合がございますので、あらかじめご了承ください。',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.darkGrey,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 40),

        // Send Mailボタン
        Center(child: _buildSendMailButton(context)),
      ],
    );
  }

  /// メール送信ボタンを構築します。
  Widget _buildSendMailButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _launchEmail,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.primaryWhite,
              border: Border.all(color: AppTheme.mediumGrey, width: 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              'send mail',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.darkGrey,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// メーラーを起動してお問い合わせメールを送信します。
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'konkana1031@gmail.com',
      query: 'subject=お問い合わせ&body=',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        _showEmailNotAvailableDialog();
      }
    } catch (e) {
      _showEmailErrorDialog();
    }
  }

  /// メーラーが利用できない場合のダイアログを表示します。
  void _showEmailNotAvailableDialog() {
    // メーラーが利用できない場合の処理
  }

  /// エラー時のダイアログを表示します。
  void _showEmailErrorDialog() {
    // エラー時のダイアログ表示
  }
}
