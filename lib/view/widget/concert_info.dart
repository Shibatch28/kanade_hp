import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanade_hp/theme/app_theme.dart';

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
          _buildTitle(),
          const SizedBox(height: 40),
          _buildMainContent(), // ここにすべてが含まれるようになります
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: GoogleFonts.notoSerifJp(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左側：フライヤー画像
        if (flyerImagePath != null)
          Expanded(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 600, // 高さを少し増やす
              ),
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
              _buildEventDetails(),
              const SizedBox(height: 40),
              _buildProgramSection(),
              const SizedBox(height: 40),
              _buildTicketSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('日時', '$date\n$time'),
        const SizedBox(height: 20),
        _buildDetailItem('会場', '$venue\n$address'),
      ],
    );
  }

  Widget _buildDetailItem(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.notoSerifJp(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: GoogleFonts.notoSerifJp(
            fontSize: 16,
            color: Colors.black54,
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
            color: Colors.black.withOpacity(0.1),
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

  Widget _buildProgramSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'プログラム',
          style: GoogleFonts.notoSerifJp(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...programs.map((program) => _buildProgramItem(program)),
      ],
    );
  }

  Widget _buildProgramItem(ProgramItem program) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            program.composer,
            style: GoogleFonts.notoSerifJp(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
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
                    style: GoogleFonts.notoSerifJp(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      piece,
                      style: GoogleFonts.notoSerifJp(
                        fontSize: 16,
                        color: Colors.black54,
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

  Widget _buildTicketSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'チケット情報',
          style: GoogleFonts.notoSerifJp(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        _buildDetailItem('料金', ticketPrice),
        const SizedBox(height: 20),
        Text(
          ticketInfo,
          style: GoogleFonts.notoSerifJp(
            fontSize: 16,
            color: Colors.black54,
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
                  style: GoogleFonts.notoSerifJp(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: Text(
                    option,
                    style: GoogleFonts.notoSerifJp(
                      fontSize: 16,
                      color: Colors.black54,
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
