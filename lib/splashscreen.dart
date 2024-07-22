import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bamservices/screen/dashboard_active.dart';
import 'package:bamservices/theme/bam.colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: black_color,
      splash: 'assets/img/logobam.png',
      nextScreen: DashboardPage(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(milliseconds: 100),
    );
  }
}