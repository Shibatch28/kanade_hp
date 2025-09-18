import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanade_hp/state/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void navigateToHome() {
    emit(state.copyWith(currentScreen: ScreenType.home));
  }

  void navigateToAbout() {
    emit(state.copyWith(currentScreen: ScreenType.about));
  }

  void navigateToConcerts() {
    emit(state.copyWith(currentScreen: ScreenType.concerts));
  }

  void navigateToGallery() {
    emit(state.copyWith(currentScreen: ScreenType.gallery));
  }

  void navigateToContact() {
    emit(state.copyWith(currentScreen: ScreenType.contact));
  }

  void setLoading(bool loading) {
    emit(state.copyWith(isLoading: loading));
  }
}
