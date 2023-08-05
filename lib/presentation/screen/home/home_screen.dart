import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:filmio/constants/colors.dart';
import 'package:filmio/presentation/screen/home/widgets/home_movie_list.dart';
import 'package:filmio/presentation/screen/home/widgets/home_carousel.dart';

import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgSrc = [
    "twilight.jpeg",
    "quantum_poster.jpg",
    "Avatar.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          return const ContinueWatchWidget();
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const HomeMovieList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContinueWatchWidget extends StatelessWidget {
  const ContinueWatchWidget({
    super.key,
  });

  final double widthCard = 180;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      width: widthCard,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'images/hp-preview.jpg',
                  fit: BoxFit.cover,
                ),
                Align(
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/play-bold.svg',
                      height: 22,
                      width: 22,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: ThemeColors.white,
                    height: 2,
                    // This value just for template change later
                    // if got value from API
                    width: widthCard * Random().nextDouble(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: ThemeColors.primary.shade100,
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
  }
}
