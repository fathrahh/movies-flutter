import 'package:filmio/common_widgets/custom_chip.dart';
import 'package:filmio/constants/colors.dart';
import 'package:filmio/constants/typography.dart';
import 'package:flutter/material.dart';

class WatchListScreen extends StatefulWidget {
  static String route = 'watchlist';
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  String filterMoviesTypeBy = "all";

  // Change This Filter later
  Map<String, String> filters = {
    "all": "All",
    "movies": "Movies",
    "tv": "TV Shows",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: MediaQuery.of(context).viewPadding.top + 24),
              screenTitle[WatchListScreen.route]!,
              const SizedBox(
                height: 16,
              ),
              Row(
                children: filters.entries.map(
                  (filter) {
                    return Row(
                      children: [
                        CustomChip(
                          text: filter.value,
                          backgroundColor: filter.key == filterMoviesTypeBy
                              ? ThemeColors.primary.shade400
                              : ThemeColors.primary,
                          onTap: () {
                            setState(() {
                              filterMoviesTypeBy = filter.key;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 24),
            ]),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () => {debugPrint("test")},
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Image.asset(
                      'images/quantum_poster.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: 11,
            ),
          ),
        ],
      ),
    );
  }
}
