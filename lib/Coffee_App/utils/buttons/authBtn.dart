import 'package:flutter/material.dart';
import 'package:test_one/Screens/colors/colors.dart';

Widget authBtn(btnText, btnFunc) {
  return SizedBox(
    height: 48,
    width: 335,
    child: ElevatedButton(
        onPressed: btnFunc,
        style: ElevatedButton.styleFrom(
            backgroundColor: colorCodes.liverChestnut,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        child: Text(
          btnText,
          style: TextStyle(
            fontFamily: 'Rosarivo',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colorCodes.neonWhite,
          ),
        )),
  );
}
