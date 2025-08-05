import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primaryContainer: const Color(0xFFE9AF00),
    primary: const Color(0xFFE9AF00),
    onPrimary: const Color(0xFF191917),
    secondary: const Color(0xFFF28500),
    onSecondary: const Color(0xFF191917),
    error: const Color(0xFFC71A11),
    onError: const Color(0xFFFFFFFF),
    surface: const Color(0xFF191917),
    onSurface: const Color(0xFFFFFFFF),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);
