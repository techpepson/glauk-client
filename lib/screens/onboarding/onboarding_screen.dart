import 'package:flutter/material.dart';
import 'package:glauk/components/onboarding/intro_screen.dart';
import 'package:glauk/components/onboarding/entry_screen_onboard.dart.dart';
import 'package:glauk/components/onboarding/upload_onboarding_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _screens = [
    IntroScreen(),
    UploadOnboardingScreen(),
    EntryScreenOnboard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: PageView(children: _screens),
          );
        },
      ),
    );
  }
}
