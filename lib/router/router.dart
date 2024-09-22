import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/movie/movie_list_screen.dart';
import 'package:movie_app/presentation/splash/splash_screen.dart';

final router = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
      path: '/splash',
      builder: (context, state) {
        return const SplashScreen();
      }),
  GoRoute(
      path: '/movie_list',
      builder: (context, state) {
        return const MovieListScreen();
      })
]);
