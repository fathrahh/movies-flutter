import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:filmio/constants/colors.dart';
import 'package:filmio/presentation/screen/home/widgets/home_movie_list.dart';
import 'package:filmio/presentation/screen/home/widgets/home_carousel.dart';
import 'package:filmio/common_widgets/app_bottom_navigation.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgSrc = [
    "twilight.jpeg",
    "quantum_poster.jpg",
    "Avatar.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).viewPadding.top + 24, 0, 0),
        child: Column(
          children: <Widget>[
            HomeCarousel(imgSrc: imgSrc),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue watching',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              color: ThemeColors.gray,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: List.generate(10, (index) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            width: 180,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                        'images/hp-preview.jpg',
                                        fit: BoxFit.cover,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Hospital Playlist",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "Eps 4, Season 2",
                                              style: TextStyle(
                                                color: ThemeColors
                                                    .primary.shade100,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/more.svg',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const HomeMovieList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
