import 'package:flutter/material.dart';

final CheckboxThemeData checkboxTheme = CheckboxThemeData(
  side: const BorderSide(
    strokeAlign: BorderSide.strokeAlignOutside,
    color: Color.fromRGBO(164, 163, 169, 1),
    width: 2.0,
    style: BorderStyle.solid,
  ),
  checkColor: MaterialStateProperty.all(const Color.fromRGBO(210, 209, 212, 1)),
  fillColor: const MaterialStatePropertyAll(Color.fromRGBO(25, 24, 37, 1)),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(2.0),
    ),
  ),
);
