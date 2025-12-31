import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanade_hp/state/navigation_state.dart';

/// アプリケーションのナビゲーション状態を管理するCubit。
///
/// 各画面への遷移とURL basedルーティングを管理します。
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  /// 初期ページを設定します（URLベース）。
  ///
  /// [page] - ページ名（'home', 'about', 'concerts', 'gallery', 'contact'）
  void setInitialPage(String page) {
    final screenType = NavigationState.screenTypeFromPath('/$page');
    if (screenType != state.currentScreen) {
      emit(state.copyWith(currentScreen: screenType));
    }
  }

  /// ホーム画面に遷移します。
  void navigateToHome() {
    emit(state.copyWith(currentScreen: ScreenType.home));
    GoRouter.of(_context!).go('/');
  }

  /// プロフィール画面（足跡）に遷移します。
  void navigateToAbout() {
    emit(state.copyWith(currentScreen: ScreenType.about));
    GoRouter.of(_context!).go('/about');
  }

  /// 演奏会情報画面に遷移します。
  void navigateToConcerts() {
    emit(state.copyWith(currentScreen: ScreenType.concerts));
    GoRouter.of(_context!).go('/concerts');
  }

  /// ギャラリー画面に遷移します。
  void navigateToGallery() {
    emit(state.copyWith(currentScreen: ScreenType.gallery));
    GoRouter.of(_context!).go('/gallery');
  }

  /// お問い合わせ画面に遷移します。
  void navigateToContact() {
    emit(state.copyWith(currentScreen: ScreenType.contact));
    GoRouter.of(_context!).go('/contact');
  }

  /// コンテキストを保持するための静的変数
  static dynamic _context;
  
  /// ナビゲーション用のコンテキストを設定します。
  ///
  /// [context] - BuildContext
  static void setContext(dynamic context) {
    _context = context;
  }
}
