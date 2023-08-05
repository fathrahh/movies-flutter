import 'package:filmio/constants/colors.dart';
import 'package:filmio/presentation/screen/home/account_screen.dart';
import 'package:filmio/presentation/screen/home/download_screen.dart';
import 'package:filmio/presentation/screen/home/watch_list_screen.dart';
import 'package:flutter/material.dart';

Widget title(String label) {
  return Text(
    label,
    style: const TextStyle(
      color: ThemeColors.white,
      fontSize: 20,
    ),
  );
}

Map<String, Widget> screenTitle = {
  WatchListScreen.route: title("Watchlist"),
  DownloadScreen.route: title("Download"),
  AccountScreen.route: title("Account and Settings"),
};
