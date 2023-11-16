import 'package:flutter/material.dart';

Widget openSansText(text, size, fontweight, color, {textalign}) {
  return Text(
    text,
    textAlign: textalign ?? TextAlign.center,
    style: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: size,
      fontWeight: fontweight,
      color: color,
    ),
  );
}
