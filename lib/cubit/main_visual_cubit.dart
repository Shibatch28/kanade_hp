import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:kanade_hp/state/main_visual_state.dart';
import 'dart:convert';

class MainVisualCubit extends Cubit<MainVisualState> {
  MainVisualCubit() : super(const MainVisualState());

  Future<void> loadImages() async {
    try {
      // assets/main_visual/フォルダから画像ファイルを動的に取得
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = Map<String, dynamic>.from(
        json.decode(manifestContent),
      );

      final imagePaths =
          manifestMap.keys
              .where((String key) => key.startsWith('assets/main_visual/'))
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

  void nextImage() {
    if (state.imagePaths.isEmpty) return;

    final newIndex =
        state.currentIndex < state.imagePaths.length - 1
            ? state.currentIndex + 1
            : 0;

    emit(state.copyWith(currentIndex: newIndex));
  }

  void previousImage() {
    if (state.imagePaths.isEmpty) return;

    final newIndex =
        state.currentIndex > 0
            ? state.currentIndex - 1
            : state.imagePaths.length - 1;

    emit(state.copyWith(currentIndex: newIndex));
  }

  void setCurrentIndex(int index) {
    if (index >= 0 && index < state.imagePaths.length) {
      emit(state.copyWith(currentIndex: index));
    }
  }
}
