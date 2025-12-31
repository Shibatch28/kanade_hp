import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:kanade_hp/state/main_visual_state.dart';
import 'dart:convert';

/// メインビジュアルの画像スライダーを管理するCubit。
///
/// 指定されたディレクトリから画像を読み込み、スライダーの
/// 現在のインデックスや画像パスを管理します。
class MainVisualCubit extends Cubit<MainVisualState> {
  MainVisualCubit() : super(const MainVisualState());

  /// 指定されたディレクトリから画像をロードします。
  ///
  /// [directoryPath] - assets配下の画像ディレクトリパス
  /// AssetManifest.jsonを使用して動的に画像を取得します。
  Future<void> loadImages(String directoryPath) async {
    try {
      // assets/main_visual/フォルダから画像ファイルを動的に取得
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = Map<String, dynamic>.from(
        json.decode(manifestContent),
      );

      final imagePaths =
          manifestMap.keys
              .where((String key) => key.startsWith('assets/$directoryPath/'))
              .where(
                (String key) =>
                    key.toLowerCase().endsWith('.png') ||
                    key.toLowerCase().endsWith('.jpg') ||
                    key.toLowerCase().endsWith('.jpeg'),
              )
              .toList();

      emit(state.copyWith(imagePaths: imagePaths, isLoading: false));
    } catch (e) {
      // エラーハンドリング - デフォルト画像を使用
      emit(
        state.copyWith(
          imagePaths: ['assets/main_visual/kanadesample.png'],
          isLoading: false,
        ),
      );
    }
  }

  /// 次の画像に移動します。
  ///
  /// 最後の画像の場合は最初の画像に戻ります。
  void nextImage() {
    if (state.imagePaths.isEmpty) return;

    final newIndex =
        state.currentIndex < state.imagePaths.length - 1
            ? state.currentIndex + 1
            : 0;

    emit(state.copyWith(currentIndex: newIndex));
  }

  /// 前の画像に移動します。
  ///
  /// 最初の画像の場合は最後の画像に移動します。
  void previousImage() {
    if (state.imagePaths.isEmpty) return;

    final newIndex =
        state.currentIndex > 0
            ? state.currentIndex - 1
            : state.imagePaths.length - 1;

    emit(state.copyWith(currentIndex: newIndex));
  }

  /// 指定されたインデックスの画像を表示します。
  ///
  /// [index] - 表示する画像のインデックス（0以上、画像数未満）
  void setCurrentIndex(int index) {
    if (index >= 0 && index < state.imagePaths.length) {
      emit(state.copyWith(currentIndex: index));
    }
  }
}
