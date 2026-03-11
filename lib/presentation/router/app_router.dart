import 'package:stock_pilot/presentation/pages/article_detail_screen.dart';
import 'package:stock_pilot/presentation/pages/home_screen.dart';
import 'package:stock_pilot/presentation/pages/intro_screen.dart';
import 'package:stock_pilot/presentation/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'route_names.dart';

class AppRouter {
  static GoRouter create() {
    return GoRouter(
      initialLocation: RoutePaths.intro,
      routes: [
        GoRoute(
          path: RoutePaths.intro,
          name: RouteNames.intro,
          builder: (_, __) => const IntroScreen(),
        ),
        GoRoute(
          path: RoutePaths.signUp,
          name: RouteNames.signUp,
          builder: (_, __) => const SignUpScreen(),
        ),
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: RoutePaths.articleDetail,
          name: RouteNames.articleDetail,
          builder: (_, __) => const ArticleDetailScreen(),
        ),
      ],
    );
  }
}
