import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanade_hp/cubit/navigation_cubit.dart';
import 'package:kanade_hp/state/navigation_state.dart';
import 'package:kanade_hp/view/screen/about_screen.dart';
import 'package:kanade_hp/view/screen/concerts_screen.dart';
import 'package:kanade_hp/view/screen/contact_screen.dart';
import 'package:kanade_hp/view/screen/gallery_screen.dart';
import 'package:kanade_hp/view/screen/home_screen.dart';
import 'package:kanade_hp/view/widget/custom_app_bar.dart';
import 'package:kanade_hp/view/widget/custom_footer.dart';

class MainScreen extends StatelessWidget {
  final String initialPage;

  const MainScreen({super.key, this.initialPage = 'home'});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = NavigationCubit();
        NavigationCubit.setContext(context);

        if (initialPage != 'home') {
          cubit.setInitialPage(initialPage);
        }

        return cubit;
      },
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              currentScreen: state.currentScreen, // 現在のスクリーン状態を渡す
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCurrentScreen(state.currentScreen),
                  const CustomFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentScreen(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.home:
        return const HomeScreen();
      case ScreenType.about:
        return const AboutScreen();
      case ScreenType.concerts:
        return const ConcertsScreen();
      case ScreenType.gallery:
        return const GalleryScreen();
      case ScreenType.contact:
      // return const ContactScreen();
      default:
        return const Center(child: Text('ページが見つかりません'));
    }
  }
}
