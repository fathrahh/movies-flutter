import 'package:filmio/common_widgets/custom_chip.dart';
import 'package:filmio/constants/colors.dart';
import 'package:filmio/constants/typography.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  static String route = "Download";
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  String filterMoviesTypeBy = "all";

  // Change This Filter later
  Map<String, String> filters = {
    "all": "All",
    "movies": "Movies",
    "tv": "TV Shows",
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          screenTitle[DownloadScreen.route]!,
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
        ],
      ),
    );
  }
}
