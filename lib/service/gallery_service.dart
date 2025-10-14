import 'package:flutter/services.dart';
import 'dart:convert';

class GalleryService {
  static Future<List<String>> loadGalleryImages() async {
    try {
      // AssetManifestから画像一覧を取得
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // ギャラリー用の画像ファイルをフィルタリング
      final imageAssets =
          manifestMap.keys
              .where(
                (String key) =>
                    key.startsWith('assets/gallery/') &&
                    (key.endsWith('.jpg') ||
                        key.endsWith('.jpeg') ||
                        key.endsWith('.png') ||
                        key.endsWith('.webp')),
              )
              .toList();

      imageAssets.sort(); // ファイル名順にソート
      return imageAssets;
    } catch (e) {
      // エラー時のフォールバック
      return _getDefaultImages();
    }
  }

  static List<String> _getDefaultImages() {
    // デフォルト画像のリスト（実際にあるファイルに合わせて調整）
    return [
      'assets/gallery/image1.jpg',
      'assets/gallery/image2.jpg',
      'assets/gallery/image3.jpg',
      'assets/gallery/image4.jpg',
      'assets/gallery/image5.jpg',
      'assets/gallery/image6.jpg',
    ];
  }
}
