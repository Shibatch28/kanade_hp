import 'package:flutter/material.dart';
import 'package:kanade_hp/theme/app_theme.dart';

/// ギャラリーの個別アイテムを表示するウィジェット。
///
/// 画像をサムネイル形式で表示し、タップでフルスクリーン表示します。
class GalleryItem extends StatelessWidget {
  final String imagePath;
  final int index;
  final VoidCallback onTap;

  const GalleryItem({
    super.key,
    required this.imagePath,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: 'gallery_image_$index',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppTheme.lightGrey,
                  child: Icon(
                    Icons.image_not_supported,
                    color: AppTheme.mediumGrey,
                    size: 50,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
