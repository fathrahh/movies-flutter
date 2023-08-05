import 'package:filmio/presentation/screen/home/account_screen.dart';
import 'package:filmio/presentation/screen/home/download_screen.dart';
import 'package:filmio/presentation/screen/home/home_screen.dart';
import 'package:filmio/presentation/screen/home/search_screen.dart';
import 'package:filmio/presentation/screen/home/watch_list_screen.dart';
import 'package:flutter/material.dart';

import 'package:filmio/common_widgets/app_bottom_navigation.dart';

class TabScreenPage extends StatefulWidget {
  static const routeName = '/';

  const TabScreenPage({super.key});

  @override
  State<TabScreenPage> createState() => _TabScreenPageState();
}

class _TabScreenPageState extends State<TabScreenPage> {
  late List<Widget> _pages;
  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(
        key: PageStorageKey("Home"),
      ),
      const WatchListScreen(
        key: PageStorageKey("Watch"),
      ),
      const SearchScreen(
        key: PageStorageKey("Search"),
      ),
      const DownloadScreen(
        key: PageStorageKey("Download"),
      ),
      const AccountScreen(
        key: PageStorageKey("Account"),
      ),
    ];
  }

  void onTapNavigation(int currentIdx) {
    setState(() => _selectedPage = currentIdx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: _selectedPage,
        onTap: onTapNavigation,
      ),
      body: PageStorage(
        bucket: bucket,
        child: _pages[_selectedPage],
      ),
    );
  }
}
