import 'package:go_router/go_router.dart';
import 'package:umbrella/presentation/screens/onboarding_screen.dart';

GoRouter appRouter({String? initialLocation}) {
  return GoRouter(
    initialLocation: "/onboarding",
    routes: [
      GoRoute(
        path: '/onboarding',
        name: OnboardingScreen.routeName,
        builder: (context, state) {
          return OnboardingScreen();
        },
      ),
    ],
  );
}
