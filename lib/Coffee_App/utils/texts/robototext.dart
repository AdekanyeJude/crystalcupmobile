import 'package:flutter/material.dart';

Widget robotoText(text, size, fontweight, color, {textalign}) {
  return Text(
    text,
    textAlign: textalign ?? TextAlign.center,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: size,
      fontWeight: fontweight,
      color: color,
    ),
  );
}
