import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/home/Homescreen.dart';
import 'package:test_one/Coffee_App/onboarding/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final primaryColor = HexColor("#01A05D");
    // final primarySwatch = MaterialColor(primaryColor.value, {
    //   50: primaryColor.withOpacity(0.1),
    //   100: primaryColor.withOpacity(0.2),
    //   200: primaryColor.withOpacity(0.3),
    //   300: primaryColor.withOpacity(0.4),
    //   400: primaryColor.withOpacity(0.5),
    //   500: primaryColor.withOpacity(0.6),
    //   600: primaryColor.withOpacity(0.7),
    //   700: primaryColor.withOpacity(0.8),
    //   800: primaryColor.withOpacity(0.9),
    //   900: primaryColor.withOpacity(1.0),
    // });
    // final colorScheme = ColorScheme.fromSwatch(primarySwatch: primarySwatch);
    return MaterialApp(
      title: 'Store appp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: colorScheme.copyWith(background: Colors.white),
          ),
      home: const Homescreen(),
    );
  }
}
