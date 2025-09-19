import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanade_hp/cubit/main_visual_cubit.dart';
import 'package:kanade_hp/state/main_visual_state.dart';

class MainVisual extends StatelessWidget {
  const MainVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainVisualCubit()..loadImages(),
      child: const _MainVisualContent(),
    );
  }
}

class _MainVisualContentState extends State<_MainVisualContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = screenHeight - appBarHeight - statusBarHeight;

    return BlocConsumer<MainVisualCubit, MainVisualState>(
      listener: (context, state) {
        // 無限ループを防ぐために条件を追加
        if (!state.isLoading &&
            state.imagePaths.isNotEmpty &&
            _pageController.hasClients &&
            (_pageController.page?.round() ?? 0) != state.currentIndex) {
          _pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return SizedBox(
            height: availableHeight,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.imagePaths.isEmpty) {
          return SizedBox(
            height: availableHeight,
            child: const Center(child: Text('画像が見つかりません')),
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            // PageViewで画像をスクロール可能に
            SizedBox(
              height: availableHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: state.imagePaths.length,
                onPageChanged: (index) {
                  // ページが変更されたときにCubitの状態を更新
                  context.read<MainVisualCubit>().setCurrentIndex(index);
                },
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        state.imagePaths[index],
                        width: double.infinity,
                        height: availableHeight,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: availableHeight,
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                    ],
                  );
                },
              ),
            ),

            // 固定テキスト（画像の上に重ねて配置）
            Center(
              child: Text(
                '近藤 奏 Official',
                style:
                    Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 48,
                      color: Colors.white.withValues(alpha: 0.8),
                      letterSpacing: 4.0,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ],
                    ) ??
                    GoogleFonts.notoSerifJp(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.8),
                      letterSpacing: 4.0,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                textAlign: TextAlign.center,
              ),
            ),

            // 左矢印ボタン
            if (state.imagePaths.length > 1)
              Positioned(
                left: 20,
                child: IconButton(
                  onPressed:
                      () => context.read<MainVisualCubit>().previousImage(),
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 40,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.3),
                  ),
                ),
              ),
            // 右矢印ボタン
            if (state.imagePaths.length > 1)
              Positioned(
                right: 20,
                child: IconButton(
                  onPressed: () => context.read<MainVisualCubit>().nextImage(),
                  icon: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 40,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.3),
                  ),
                ),
              ),
            // インジケーター
            if (state.imagePaths.length > 1)
              Positioned(
                bottom: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    state.imagePaths.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            index == state.currentIndex
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _MainVisualContent extends StatefulWidget {
  const _MainVisualContent();

  @override
  State<_MainVisualContent> createState() => _MainVisualContentState();
}
