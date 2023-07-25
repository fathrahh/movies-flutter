import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(25, 24, 37, 1),
  inputDecorationTheme: _inputDecorationTheme,
);

const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
);
