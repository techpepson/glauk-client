import 'package:flutter/material.dart';
import 'package:glauk/routes/student_routes.dart';
import 'package:glauk/screens/auth/login_screen.dart';
import 'package:glauk/screens/auth/register_screen.dart';
import 'package:glauk/screens/exams/student_exams.dart';
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

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return StudentRoutes(navigationShell: navigationShell);
      },
      branches: [
        // Exams Branch
        StatefulShellBranch(
          initialLocation: '/student-exams',
          routes: [
            GoRoute(
              path: '/student-exams',
              builder:
                  (context, state) => FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 2)),
                    builder: (context, snapshot) => const StudentExams(),
                  ),
            ),
          ],
        ),
        // Quiz Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/student-quiz',
              builder:
                  (context, state) => FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 2)),
                    builder: (context, snapshot) => const Placeholder(),
                  ),
            ),
          ],
        ),
        // Groups Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/student-groups',
              builder:
                  (context, state) => FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 2)),
                    builder: (context, snapshot) => const Placeholder(),
                  ),
            ),
          ],
        ),
        // Analytics Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/student-analytics',
              builder:
                  (context, state) => FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 2)),
                    builder: (context, snapshot) => const Placeholder(),
                  ),
            ),
          ],
        ),
        // Deck Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/student-deck',
              builder:
                  (context, state) => FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 2)),
                    builder: (context, snapshot) => const Placeholder(),
                  ),
            ),
          ],
        ),
      ],
    ),
  ],
);
