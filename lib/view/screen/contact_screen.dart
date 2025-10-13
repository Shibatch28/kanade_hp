import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/view/widget/main_visual.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // メインビジュアル（小さめ）
        // const MainVisual(height: 300),

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
                  // タイトル
                  Text(
                    'contact',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // サブタイトル
                  Text(
                    '( お問い合わせ )',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.mediumGrey,
                      letterSpacing: 2.0,
                    ),
                  ),

                  const SizedBox(height: 80),

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

  void _showEmailNotAvailableDialog() {
    // メーラーが利用できない場合の処理
  }

  void _showEmailErrorDialog() {
    // エラー時のダイアログ表示
  }
}
