import 'package:flutter/material.dart';
import 'package:filmio/constants/colors.dart';

final BottomNavigationBarThemeData bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  backgroundColor: ThemeColors.primary,
  selectedItemColor: ThemeColors.white,
  unselectedItemColor: ThemeColors.gray.shade400,
  selectedLabelStyle: const TextStyle(
    fontWeight: FontWeight.w600,
  ),
  unselectedLabelStyle: const TextStyle(
    fontWeight: FontWeight.normal,
  ),
);
