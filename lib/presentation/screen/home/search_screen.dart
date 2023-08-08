import 'package:filmio/common_widgets/custom_chip.dart';
import 'package:filmio/common_widgets/search_bar.dart';
import 'package:filmio/constants/colors.dart';
import 'package:filmio/mock/movie_genres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                // Todo: Add controller laters
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: CustomSearchBar(
                          hintText: "Find movies, tv shows, and more",
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      IntrinsicWidth(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              backgroundColor: ThemeColors.primary,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 24,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Filters",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            icon: SvgPicture.asset(
                                              "assets/icons/close.svg",
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                ThemeColors.white,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      const Text(
                                        "Genres",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.gray,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Wrap(
                                        spacing: 8.0,
                                        runSpacing: 8.0,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: moviesGenres
                                            .asMap()
                                            .entries
                                            .map(
                                              (entry) => CustomChip(
                                                text: entry.value,
                                                textStyle: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                prefix: const SizedBox(
                                                  width: 8.0,
                                                ),
                                                prefixIcon: Transform.rotate(
                                                  angle: entry.key == 0
                                                      ? 0
                                                      : 45 * pi / 180,
                                                  child: SizedBox(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    child: SvgPicture.asset(
                                                      "assets/icons/close.svg",
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                        ThemeColors.white,
                                                        BlendMode.srcIn,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                backgroundColor: entry.key == 0
                                                    ? ThemeColors
                                                        .primary.shade400
                                                    : null,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      const Text(
                                        "Type of shows",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.gray,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          CustomChip(
                                            text: "avatar",
                                            backgroundColor:
                                                ThemeColors.primary.shade400,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          CustomChip(
                                            text: "avatar",
                                            backgroundColor:
                                                ThemeColors.primary.shade400,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          CustomChip(
                                            text: "avatar",
                                            backgroundColor:
                                                ThemeColors.primary.shade400,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: ThemeColors.primary.shade400,
                                borderRadius: BorderRadius.circular(16.0)),
                            child: SvgPicture.asset(
                              "assets/icons/filter.svg",
                              colorFilter: const ColorFilter.mode(
                                  ThemeColors.white, BlendMode.srcIn),
                              width: 24,
                              height: 24,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Latest searched"),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CustomChip(
                          text: "Avatar",
                          backgroundColor: ThemeColors.primary.shade400,
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomChip(
                          text: "Indisious",
                          backgroundColor: ThemeColors.primary.shade400,
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomChip(
                          text: "Home for",
                          backgroundColor: ThemeColors.primary.shade400,
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Latest searched"),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/trend-up.svg",
                          colorFilter: const ColorFilter.mode(
                              ThemeColors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("Elemental")
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/trend-up.svg",
                          colorFilter: const ColorFilter.mode(
                              ThemeColors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("Elemental")
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/trend-up.svg",
                          colorFilter: const ColorFilter.mode(
                              ThemeColors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("Elemental")
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/trend-up.svg",
                          colorFilter: const ColorFilter.mode(
                              ThemeColors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("Elemental")
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/trend-up.svg",
                          colorFilter: const ColorFilter.mode(
                              ThemeColors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("Elemental")
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          //  i want to put ListScrollHorizontal here
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Suggested for you"),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 16,
                      );
                    },
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {debugPrint("test")},
                        child: Container(
                          width: 120,
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
