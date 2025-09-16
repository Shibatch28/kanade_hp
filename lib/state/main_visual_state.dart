class MainVisualState {
  final List<String> imagePaths;
  final int currentIndex;
  final bool isLoading;

  const MainVisualState({
    this.imagePaths = const [],
    this.currentIndex = 0,
    this.isLoading = true,
  });

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
