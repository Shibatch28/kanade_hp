/// メインビジュアルの状態を保持するクラス。
///
/// 画像パスのリスト、現在のインデックス、ロード中フラグを管理します。
class MainVisualState {
  final List<String> imagePaths;
  final int currentIndex;
  final bool isLoading;

  const MainVisualState({
    this.imagePaths = const [],
    this.currentIndex = 0,
    this.isLoading = true,
  });

  /// プロパティの一部を変更した新しいインスタンスを生成します。
  MainVisualState copyWith({
    List<String>? imagePaths,
    int? currentIndex,
    bool? isLoading,
  }) {
    return MainVisualState(
      imagePaths: imagePaths ?? this.imagePaths,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
