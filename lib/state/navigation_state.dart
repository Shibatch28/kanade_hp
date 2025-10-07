import 'package:equatable/equatable.dart';

enum ScreenType { home, about, concerts, gallery, contact }

class NavigationState extends Equatable {
  final ScreenType currentScreen;

  const NavigationState({this.currentScreen = ScreenType.home});

  NavigationState copyWith({ScreenType? currentScreen}) {
    return NavigationState(currentScreen: currentScreen ?? this.currentScreen);
  }

  @override
  List<Object> get props => [currentScreen];

  // URLパスを取得
  String get currentPath {
    switch (currentScreen) {
      case ScreenType.home:
        return '/';
      case ScreenType.about:
        return '/about';
      case ScreenType.concerts:
        return '/concerts';
      case ScreenType.gallery:
        return '/gallery';
      case ScreenType.contact:
        return '/contact';
    }
  }

  // URLパスからScreenTypeを取得
  static ScreenType screenTypeFromPath(String path) {
    switch (path) {
      case '/':
        return ScreenType.home;
      case '/about':
        return ScreenType.about;
      case '/concerts':
        return ScreenType.concerts;
      case '/gallery':
        return ScreenType.gallery;
      case '/contact':
        return ScreenType.contact;
      default:
        return ScreenType.home;
    }
  }
}
