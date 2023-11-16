import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Coffee_App/onboarding/onboardingscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Onboardingscreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCodes.shadowBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/kyrstalcup.png',
              height: 110,
              width: 80,
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              'KRYSTAL CUP',
              style: TextStyle(
                fontFamily: 'Rosarivo',
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
                color: colorCodes.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
