import 'package:go_router/go_router.dart';
import 'package:umbrella/core/dependency_injection.dart';
import 'package:umbrella/data/repositories/settings_repository.dart';
import 'package:umbrella/presentation/scaffold_with_nav_bar.dart';
import 'package:umbrella/presentation/screens/onboarding_screen.dart';
import 'package:umbrella/presentation/screens/search_screen.dart';
import 'package:umbrella/presentation/screens/settings_screen.dart';
import 'package:umbrella/presentation/screens/weather_screen.dart';

GoRouter appRouter() {
  return GoRouter(
    initialLocation: getInitialRoute(),
    routes: [
      GoRoute(
        path: '/onboarding',
        name: OnboardingScreen.routeName,
        builder: (context, state) {
          return OnboardingScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/weather",
                name: WeatherScreen.routeName,
                builder: (context, state) {
                  return WeatherScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/search",
                name: SearchScreen.routeName,
                builder: (context, state) {
                  return SearchScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/settings",
                name: SettingsScreen.routeName,
                builder: (context, state) {
                  return SettingsScreen();
                },
              )
            ],
          ),
        ],
      ),
    ],
  );
}


String getInitialRoute() {
  final location = sl<SettingsRepository>().getDefaultLocation();
  if (location == null) {
    return "/onboarding";
  }
  return "/weather";
}
