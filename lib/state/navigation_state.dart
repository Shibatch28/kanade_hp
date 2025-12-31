import 'package:equatable/equatable.dart';

/// 画面の種類を表す列挙型。
enum ScreenType { home, about, concerts, gallery, contact }

/// ナビゲーション状態を保持するクラス。
///
/// 現在表示中の画面を管理し、URLパスとの変換を提供します。
class NavigationState extends Equatable {
  final ScreenType currentScreen;

  const NavigationState({this.currentScreen = ScreenType.home});

  /// プロパティの一部を変更した新しいインスタンスを生成します。
  NavigationState copyWith({ScreenType? currentScreen}) {
    return NavigationState(currentScreen: currentScreen ?? this.currentScreen);
  }

  @override
  List<Object> get props => [currentScreen];

  /// 現在の画面に対応するURLパスを取得します。
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

  /// URLパスからScreenTypeを取得します。
  ///
  /// [path] - URLパス（例: '/', '/about', '/concerts'）
  /// 返り値: 対応するScreenType（不明な場合はhome）
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
