import 'package:flutter/material.dart';
import 'package:patananny/splash_screen.dart';
import 'screens/screens.barrel.dart' show SecureScreen;
import 'package:patananny/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pata Nanny',
      debugShowCheckedModeBanner: false,
      theme: NannyTheme.light(),
      home: SplashScreen()
    );
  }
}
