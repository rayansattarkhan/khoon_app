import 'package:flutter/material.dart';
import 'package:khoon_app/views/auth_views/sign_in_screen.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/images/splash_screen_logo/khoon_app_splash_screen_logo.png",
            scale: 16,
          ),
        ),
      ),
    );
  }
}
