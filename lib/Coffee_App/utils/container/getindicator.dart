import 'package:flutter/material.dart';
import 'package:test_one/Screens/colors/colors.dart';

AnimatedContainer getIndicator(int pageNo, currentPage) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    height: 7,
    width: (currentPage == pageNo) ? 24 : 7,
    margin: const EdgeInsets.symmetric(horizontal: 3),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: (currentPage == pageNo)
            ? colorCodes.mangoliaWhite
            : colorCodes.roseQuartz),
  );
}
