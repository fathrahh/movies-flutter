import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  // useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(25, 24, 37, 1),
  inputDecorationTheme: _inputDecorationTheme,
  listTileTheme: _listTileTheme,
);

const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
);

const ListTileThemeData _listTileTheme = ListTileThemeData(
  contentPadding: EdgeInsets.zero,
  dense: true,
);
