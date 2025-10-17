import 'package:flutter/material.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/utils/responsive.dart';

class ConcertInfo extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String address;
  final String? flyerImagePath;
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
    this.flyerImagePath,
    required this.programs,
    required this.ticketPrice,
    required this.ticketInfo,
    required this.ticketOptions,
  });

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

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryBlack,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (flyerImagePath != null) ...[
            _buildFlyerImage(),
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
        if (flyerImagePath != null)
          Expanded(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: _buildFlyerImage(),
            ),
          ),
        if (flyerImagePath != null) const SizedBox(width: 40),
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

  Widget _buildEventDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem(context, '日時', '$date\n$time'),
        const SizedBox(height: 20),
        _buildDetailItem(context, '会場', '$venue\n$address'),
      ],
    );
  }

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

  Widget _buildFlyerImage() {
    return Container(
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
        child: Image.asset(flyerImagePath!, fit: BoxFit.contain),
      ),
    );
  }

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
        ...programs.map((program) => _buildProgramItem(context, program)),
      ],
    );
  }

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
        _buildDetailItem(context, '料金', ticketPrice),
        const SizedBox(height: 20),
        Text(
          ticketInfo,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.darkGrey,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        ...ticketOptions.map(
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

class ProgramItem {
  final String composer;
  final List<String> pieces;

  const ProgramItem({required this.composer, required this.pieces});
}
