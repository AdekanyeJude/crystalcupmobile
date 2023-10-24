import 'package:flutter/material.dart';
import 'package:test_one/Screens/colors/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCodes.background,
      body: Center(
        child: Column(
          children: [
            Image.asset(''),
            SizedBox(height: 10,),
            Text('')
          ],
        ),
      ),
    );
  }
}
