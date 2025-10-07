import 'package:go_router/go_router.dart';
import 'package:kanade_hp/view/screen/main_screen.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainScreen(initialPage: 'home'),
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (context, state) => const MainScreen(initialPage: 'about'),
      ),
      GoRoute(
        path: '/concerts',
        name: 'concerts',
        builder: (context, state) => const MainScreen(initialPage: 'concerts'),
      ),
      GoRoute(
        path: '/gallery',
        name: 'gallery',
        builder: (context, state) => const MainScreen(initialPage: 'gallery'),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        builder: (context, state) => const MainScreen(initialPage: 'contact'),
      ),
    ],
  );

  static GoRouter get router => _router;
}
