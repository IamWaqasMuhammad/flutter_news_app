import 'package:flutter/material.dart';
import 'package:flutter_news_app/config/app_theme/app_theme.dart';
import 'package:flutter_news_app/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khabar App',
      theme:AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      themeAnimationCurve: Curves.easeIn,
      themeAnimationDuration: Durations.short1,
      home: OnboardingScreen(),
    );
  }
}

