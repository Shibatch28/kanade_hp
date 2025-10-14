import 'package:flutter/material.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/view/widget/gallery_grid.dart';
import 'package:kanade_hp/service/gallery_service.dart';
import 'package:kanade_hp/view/widget/main_visual.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> _imageAssets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGalleryImages();
  }

  Future<void> _loadGalleryImages() async {
    final images = await GalleryService.loadGalleryImages();
    setState(() {
      _imageAssets = images;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // メインビジュアル（小さめ）
        const MainVisual(
          title: 'ギャラリー',
          imageDirectory: 'vis_gallery',
          height: 300,
        ),
        // ギャラリーコンテンツ
        Container(
          color: AppTheme.primaryWhite,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // サブタイトル
                  Text(
                    '演奏会の写真や思い出の一瞬をお楽しみください。',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.mediumGrey,
                      letterSpacing: 1.0,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // ギャラリーグリッド
                  GalleryGrid(imageAssets: _imageAssets, isLoading: _isLoading),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
