import 'package:filmio/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigation extends StatelessWidget {
  AppBottomNavigation({super.key});

  final List<Map<String, String>> _items = [
    {"label": "Home", "icon": "home-outline", "activeIcon": "home-bold"},
    {"label": "Watchlist", "icon": "watchlist", "activeIcon": "watchlist-bold"},
    {"label": "Search", "icon": "search", "activeIcon": "search-bold"},
    {"label": "Download", "icon": "download", "activeIcon": "download-bold"},
    {"label": "Account", "icon": "user", "activeIcon": "user-bold"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(233, 233, 234, 1),
            width: .5,
          ),
        ),
      ),
      child: BottomNavigationBar(
          backgroundColor: ThemeColors.primary,
          items: _items.map((item) {
            return BottomNavigationBarItem(
              label: item['label'],
              icon: SvgPicture.asset("assets/icons/${item['icon']}.svg"),
              activeIcon:
                  SvgPicture.asset("assets/icons/${item['activeIcon']}.svg"),
            );
          }).toList()),
    );
  }
}
