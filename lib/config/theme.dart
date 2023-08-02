import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  // useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(28, 26, 41, 1),
  inputDecorationTheme: _inputDecorationTheme,
  listTileTheme: _listTileTheme,
  checkboxTheme: _checkboxTheme,
  fontFamily: 'Figtree',
);

final CheckboxThemeData _checkboxTheme = CheckboxThemeData(
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

const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(),
  border: InputBorder.none,
);

const ListTileThemeData _listTileTheme = ListTileThemeData(
  contentPadding: EdgeInsets.zero,
  dense: true,
);
