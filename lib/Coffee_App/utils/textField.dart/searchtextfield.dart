import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:test_one/Screens/colors/colors.dart';

Widget textField(controller, hinttext, errorText) {
  return TextField(
    style: TextStyle(
        fontFamily: 'Outfit',
        color: colorCodes.black,
        fontSize: 16,
        fontWeight: FontWeight.w400),
    controller: controller,

    autocorrect: true,
    //autofocus: true,
    enableSuggestions: true,
    // enabled: enabled,

    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      fillColor: colorCodes.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        // borderSide: BorderSide(
        //     color:
        //         (errorText != '') ? colorCodes.paleRed : colorCodes.iconcolor),
      ),
      suffixIcon: Icon(
        IconlyLight.search,
        color: colorCodes.iconcolor,
      ),
      hintText: hinttext,
      hintStyle: TextStyle(
          fontFamily: 'Outfit',
          color: colorCodes.darkGrey,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
            color:
                (errorText != '') ? colorCodes.paleRed : colorCodes.iconcolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
            color:
                (errorText != '') ? colorCodes.paleRed : colorCodes.iconcolor),
      ),
    ),
  );
}
