import 'package:glauk/components/onboarding/entry_screen_onboard.dart.dart';
import 'package:glauk/screens/auth/login_screen.dart';
import 'package:glauk/screens/auth/register_screen.dart';
import 'package:glauk/screens/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
