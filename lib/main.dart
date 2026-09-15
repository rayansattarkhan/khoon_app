import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/my_themes.dart';
import 'package:khoon_app/views/splash_screen.dart';
import 'package:khoon_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const KhoonApp());
}

class KhoonApp extends StatelessWidget {
  const KhoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khoon App',
      theme: MyThemes.myLightTheme(),
      home: SplashScreen(),
    );
  }
}
