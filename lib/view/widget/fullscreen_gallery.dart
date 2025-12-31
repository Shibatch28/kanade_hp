import 'package:flutter/material.dart';

/// フルスクリーンギャラリーを表示するウィジェット。
///
/// 画像をフルスクリーンで表示し、ページナビゲーションを提供します。
class FullscreenGallery extends StatefulWidget {
  final List<String> imageAssets;
  final int initialIndex;

  const FullscreenGallery({
    super.key,
    required this.imageAssets,
    required this.initialIndex,
  });

  @override
  State<FullscreenGallery> createState() => _FullscreenGalleryState();
}

class _FullscreenGalleryState extends State<FullscreenGallery> {
  late int currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          // 画像スライダー
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: widget.imageAssets.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: 'gallery_image_$index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.imageAssets[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // 閉じるボタン
          Positioned(
            top: 20,
            right: 20,
            child: _buildControlButton(
              icon: Icons.close,
              onTap: () => Navigator.of(context).pop(),
            ),
          ),

          // 前の画像ボタン
          if (currentIndex > 0)
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: _buildControlButton(
                  icon: Icons.chevron_left,
                  onTap: _previousImage,
                  size: 30,
                ),
              ),
            ),

          // 次の画像ボタン
          if (currentIndex < widget.imageAssets.length - 1)
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: _buildControlButton(
                  icon: Icons.chevron_right,
                  onTap: _nextImage,
                  size: 30,
                ),
              ),
            ),

          // インジケーター
          if (widget.imageAssets.length > 1)
            Positioned(bottom: 30, left: 0, right: 0, child: _buildIndicator()),
        ],
      ),
    );
  }

  /// コントロールボタンを構築します。
  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    double size = 24,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black87, size: size),
      ),
    );
  }

  /// インジケーターを構築します。
  Widget _buildIndicator() {
    final totalDots = widget.imageAssets.length;
    final maxDotsPerRow = 15; // 1行あたりの最大ドット数

    // 1行で収まる場合は通常表示
    if (totalDots <= maxDotsPerRow) {
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              totalDots,
              (index) => _buildDot(index == currentIndex),
            ),
          ),
        ),
      );
    }

    // 2行に分割して表示
    final firstRowCount = (totalDots / 2).ceil();
    final secondRowCount = totalDots - firstRowCount;

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1行目
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                firstRowCount,
                (index) => _buildDot(index == currentIndex),
              ),
            ),
            const SizedBox(height: 8),
            // 2行目
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                secondRowCount,
                (index) => _buildDot(index + firstRowCount == currentIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// インジケーターのドットを構築します。
  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.4),
        boxShadow:
            isActive
                ? [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ]
                : null,
      ),
    );
  }

  /// 前の画像に移動します。
  void _previousImage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// 次の画像に移動します。
  void _nextImage() {
    if (currentIndex < widget.imageAssets.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
