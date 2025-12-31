import 'package:flutter/material.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/utils/responsive.dart';

/// 演奏会情報を表示するウィジェット。
///
/// 演奏会の詳細情報、プログラム、チケット情報を表示します。
/// 複数のフライヤー画像がある場合は、矢印ボタンで切り替えられます。
class ConcertInfo extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String address;
  final List<String> flyerImagePaths;
  final List<ProgramItem> programs;
  final String ticketPrice;
  final String ticketInfo;
  final List<String> ticketOptions;

  const ConcertInfo({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.address,
    this.flyerImagePaths = const [],
    required this.programs,
    required this.ticketPrice,
    required this.ticketInfo,
    required this.ticketOptions,
  });

  @override
  State<ConcertInfo> createState() => _ConcertInfoState();
}

class _ConcertInfoState extends State<ConcertInfo> {
  int _currentImageIndex = 0;

  void _nextImage() {
    if (_currentImageIndex < widget.flyerImagePaths.length - 1) {
      setState(() {
        _currentImageIndex++;
      });
    }
  }

  void _previousImage() {
    if (_currentImageIndex > 0) {
      setState(() {
        _currentImageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryWhite,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(context),
          const SizedBox(height: 40),
          _buildMainContent(context), // ここにすべてが含まれるようになります
        ],
      ),
    );
  }

  /// タイトルセクションを構築します。
  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryBlack,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// メインコンテンツ（画像と情報）を構築します。
  Widget _buildMainContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.flyerImagePaths.isNotEmpty) ...[
            _buildFlyerImageSection(),
            const SizedBox(height: 40),
          ],
          _buildEventDetails(context),
          const SizedBox(height: 40),
          _buildProgramSection(context),
          const SizedBox(height: 40),
          _buildTicketSection(context),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左側：フライヤー画像
        if (widget.flyerImagePaths.isNotEmpty)
          Expanded(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: _buildFlyerImageSection(),
            ),
          ),
        if (widget.flyerImagePaths.isNotEmpty) const SizedBox(width: 40),
        // 右側：日時・会場情報 + プログラム + チケット情報
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEventDetails(context),
              const SizedBox(height: 40),
              _buildProgramSection(context),
              const SizedBox(height: 40),
              _buildTicketSection(context),
            ],
          ),
        ),
      ],
    );
  }

  /// イベントの詳細情報（日時、会場）を構築します。
  Widget _buildEventDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem(context, '日時', '${widget.date}\n${widget.time}'),
        const SizedBox(height: 20),
        _buildDetailItem(context, '会場', '${widget.venue}\n${widget.address}'),
      ],
    );
  }

  /// 詳細情報の個別アイテムを構築します。
  Widget _buildDetailItem(BuildContext context, String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlack,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.darkGrey,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  /// フライヤー画像セクションを構築します（複数画像に対応）。
  Widget _buildFlyerImageSection() {
    if (widget.flyerImagePaths.isEmpty) {
      return const SizedBox.shrink();
    }

    final hasMultipleImages = widget.flyerImagePaths.length > 1;

    return Stack(
      alignment: Alignment.center,
      children: [
        // 画像
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlack.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.flyerImagePaths[_currentImageIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),
        // 左矢印ボタン
        if (hasMultipleImages && _currentImageIndex > 0)
          Positioned(
            left: 8,
            child: _buildNavigationButton(
              icon: Icons.chevron_left,
              onPressed: _previousImage,
            ),
          ),
        // 右矢印ボタン
        if (hasMultipleImages &&
            _currentImageIndex < widget.flyerImagePaths.length - 1)
          Positioned(
            right: 8,
            child: _buildNavigationButton(
              icon: Icons.chevron_right,
              onPressed: _nextImage,
            ),
          ),
        // インジケーター
        if (hasMultipleImages) Positioned(bottom: 16, child: _buildIndicator()),
      ],
    );
  }

  /// ナビゲーションボタンを構築します。
  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: AppTheme.primaryBlack),
        onPressed: onPressed,
        iconSize: 30,
      ),
    );
  }

  /// 画像インジケーターを構築します。
  Widget _buildIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.flyerImagePaths.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  index == _currentImageIndex
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ),
      ),
    );
  }

  /// プログラムセクションを構築します。
  Widget _buildProgramSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'プログラム',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlack,
          ),
        ),
        const SizedBox(height: 20),
        ...widget.programs.map(
          (program) => _buildProgramItem(context, program),
        ),
      ],
    );
  }

  /// プログラムの個別アイテムを構築します。
  Widget _buildProgramItem(BuildContext context, ProgramItem program) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            program.composer,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryBlack,
            ),
          ),
          const SizedBox(height: 8),
          ...program.pieces.map(
            (piece) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppTheme.darkGrey),
                  ),
                  Expanded(
                    child: Text(
                      piece,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.darkGrey,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// チケット情報セクションを構築します。
  Widget _buildTicketSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'チケット情報',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlack,
          ),
        ),
        const SizedBox(height: 20),
        _buildDetailItem(context, '料金', widget.ticketPrice),
        const SizedBox(height: 20),
        Text(
          widget.ticketInfo,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.darkGrey,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        ...widget.ticketOptions.map(
          (option) => Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppTheme.darkGrey),
                ),
                Expanded(
                  child: Text(
                    option,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.darkGrey,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 演奏会のプログラムアイテムを表すクラス。
class ProgramItem {
  final String composer;
  final List<String> pieces;

  const ProgramItem({required this.composer, required this.pieces});
}
