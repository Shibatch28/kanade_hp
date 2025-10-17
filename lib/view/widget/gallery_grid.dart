import 'package:flutter/material.dart';
import 'package:kanade_hp/theme/app_theme.dart';
import 'package:kanade_hp/view/widget/gallery_item.dart';
import 'package:kanade_hp/view/widget/fullscreen_gallery.dart';

class GalleryGrid extends StatelessWidget {
  final List<String> imageAssets;
  final bool isLoading;

  const GalleryGrid({
    super.key,
    required this.imageAssets,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 400,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (imageAssets.isEmpty) {
      return SizedBox(
        height: 400,
        child: Center(
          child: Text(
            '画像が見つかりません',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryBlack,
            ),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // レスポンシブなカラム数を計算
        int crossAxisCount;
        double childAspectRatio;

        if (constraints.maxWidth > 1000) {
          crossAxisCount = 4;
          childAspectRatio = 1.0;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 3;
          childAspectRatio = 1.0;
        } else {
          crossAxisCount = 2;
          childAspectRatio = 0.8;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: imageAssets.length,
          itemBuilder: (context, index) {
            return GalleryItem(
              imagePath: imageAssets[index],
              index: index,
              onTap: () => _showFullscreenImage(context, index),
            );
          },
        );
      },
    );
  }

  void _showFullscreenImage(BuildContext context, int index) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return FullscreenGallery(imageAssets: imageAssets, initialIndex: index);
      },
    );
  }
}
