import 'package:filmio/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:filmio/config/theme/checkbox_theme.dart';
import 'package:filmio/config/theme/input_theme.dart';
import 'package:filmio/config/theme/list_tile_theme.dart';
import 'package:filmio/config/theme/bottom_navigation_bar_theme.dart';

final ThemeData theme = ThemeData(
  // useMaterial3: true,
  fontFamily: 'Figtree',
  scaffoldBackgroundColor: ThemeColors.primary,
  inputDecorationTheme: inputDecorationTheme,
  listTileTheme: listTileTheme,
  checkboxTheme: checkboxTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
);
