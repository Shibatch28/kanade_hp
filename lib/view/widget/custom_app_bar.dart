import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanade_hp/cubit/navigation_cubit.dart';
import 'package:kanade_hp/state/navigation_state.dart';

/// アプリケーションのカスタムAppBarウィジェット。
///
/// ロゴとナビゲーションメニューを含みます。
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScreenType currentScreen;

  const CustomAppBar({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => context.read<NavigationCubit>().navigateToHome(),
          child: SvgPicture.asset(
            "assets/logo.svg",
            height: 32,
            semanticsLabel: "近藤 奏のホームページ",
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            tooltip: "メニューを開く",
            onPressed: () => _showNavigationMenu(context),
          ),
        ),
      ],
    );
  }

  /// ナビゲーションメニューを表示します。
  void _showNavigationMenu(BuildContext context) {
    // NavigationCubitのインスタンスを事前に取得
    final navigationCubit = context.read<NavigationCubit>();

    showModalBottomSheet(
      context: context,
      builder:
          (bottomSheetContext) => Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMenuItem(
                  navigationCubit,
                  bottomSheetContext,
                  'ホーム',
                  ScreenType.home,
                ),
                _buildMenuItem(
                  navigationCubit,
                  bottomSheetContext,
                  '足跡 (プロフィール)',
                  ScreenType.about,
                ),
                _buildMenuItem(
                  navigationCubit,
                  bottomSheetContext,
                  '演奏会情報',
                  ScreenType.concerts,
                ),
                _buildMenuItem(
                  navigationCubit,
                  bottomSheetContext,
                  'ギャラリー',
                  ScreenType.gallery,
                ),
                _buildMenuItem(
                  navigationCubit,
                  bottomSheetContext,
                  'お問い合わせ',
                  ScreenType.contact,
                ),
              ],
            ),
          ),
    );
  }

  /// メニューアイテムを構築します。
  Widget _buildMenuItem(
    NavigationCubit navigationCubit,
    BuildContext context,
    String title,
    ScreenType screenType,
  ) {
    return ListTile(
      title: Text(title),
      selected: currentScreen == screenType,
      onTap: () {
        Navigator.pop(context);
        switch (screenType) {
          case ScreenType.home:
            navigationCubit.navigateToHome();
            break;
          case ScreenType.about:
            navigationCubit.navigateToAbout();
            break;
          case ScreenType.concerts:
            navigationCubit.navigateToConcerts();
            break;
          case ScreenType.gallery:
            navigationCubit.navigateToGallery();
            break;
          case ScreenType.contact:
            navigationCubit.navigateToContact();
            break;
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
