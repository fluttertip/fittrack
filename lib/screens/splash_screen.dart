import 'package:fittrack/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Lottie.asset('assets/animations/fittrack_logo.json', height: 200),
      ),
    );
  }
}
