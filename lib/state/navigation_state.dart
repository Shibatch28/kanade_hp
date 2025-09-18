enum ScreenType { home, about, concerts, gallery, contact }

class NavigationState {
  final ScreenType currentScreen;
  final bool isLoading;

  const NavigationState({
    this.currentScreen = ScreenType.home,
    this.isLoading = false,
  });

  NavigationState copyWith({ScreenType? currentScreen, bool? isLoading}) {
    return NavigationState(
      currentScreen: currentScreen ?? this.currentScreen,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
