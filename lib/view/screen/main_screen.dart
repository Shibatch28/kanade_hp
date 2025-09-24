import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanade_hp/cubit/navigation_cubit.dart';
import 'package:kanade_hp/state/navigation_state.dart';
import 'package:kanade_hp/view/screen/home_screen.dart';
import 'package:kanade_hp/view/screen/about_screen.dart';
import 'package:kanade_hp/view/screen/concerts_screen.dart';
// import 'package:kanade_hp/view/screen/gallery_screen.dart';
// import 'package:kanade_hp/view/screen/contact_screen.dart';
import 'package:kanade_hp/view/widget/custom_app_bar.dart';
import 'package:kanade_hp/view/widget/custom_footer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(currentScreen: state.currentScreen),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // メインコンテンツ
                _buildScreen(state.currentScreen),
                // フッター
                const CustomFooter(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildScreen(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.home:
        return const HomePage();
      case ScreenType.about:
        return const AboutScreen();
      case ScreenType.concerts:
        return const ConcertsScreen();
      // case ScreenType.gallery:
      //   return const GalleryScreen();
      // case ScreenType.contact:
      //   return const ContactScreen();
      default:
        return const HomePage();
    }
  }
}
