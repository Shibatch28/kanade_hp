import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanade_hp/state/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  // 初期ページを設定（URL based）
  void setInitialPage(String page) {
    final screenType = NavigationState.screenTypeFromPath('/$page');
    if (screenType != state.currentScreen) {
      emit(state.copyWith(currentScreen: screenType));
    }
  }

  void navigateToHome() {
    emit(state.copyWith(currentScreen: ScreenType.home));
    GoRouter.of(_context!).go('/');
  }

  void navigateToAbout() {
    emit(state.copyWith(currentScreen: ScreenType.about));
    GoRouter.of(_context!).go('/about');
  }

  void navigateToConcerts() {
    emit(state.copyWith(currentScreen: ScreenType.concerts));
    GoRouter.of(_context!).go('/concerts');
  }

  void navigateToGallery() {
    emit(state.copyWith(currentScreen: ScreenType.gallery));
    GoRouter.of(_context!).go('/gallery');
  }

  void navigateToContact() {
    emit(state.copyWith(currentScreen: ScreenType.contact));
    GoRouter.of(_context!).go('/contact');
  }

  // コンテキストを保持するための変数
  static dynamic _context;
  static void setContext(dynamic context) {
    _context = context;
  }
}
