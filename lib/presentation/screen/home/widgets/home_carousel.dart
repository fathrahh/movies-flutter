import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  final List<String> imgSrc;

  const HomeCarousel({super.key, required this.imgSrc});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  CarouselController higlightCarouselController = CarouselController();
  int _currentHighlight = 0;

  void setCurrentHighlight(int currentHighlight) {
    setState(() {
      _currentHighlight = currentHighlight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: higlightCarouselController,
          options: CarouselOptions(
              // Sementara make 3/5 viewport height
              height: MediaQuery.of(context).size.height * 3 / 5,
              viewportFraction: 0.8,
              autoPlay: true,
              disableCenter: true,
              enlargeCenterPage: true,
              onPageChanged: (idx, reason) {
                setCurrentHighlight(idx);
              }),
          items: widget.imgSrc.asMap().entries.map((item) {
            bool isBlur = item.key != _currentHighlight;

            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: isBlur ? 5.0 : 0,
                          sigmaY: isBlur ? 5.0 : 0,
                        ),
                        child: Image.asset(
                          'images/${item.value}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
          }).toList(),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgSrc.asMap().entries.map((item) {
            return GestureDetector(
              onTap: () => higlightCarouselController.animateToPage(item.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: _currentHighlight == item.key ? 24 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: (_currentHighlight == item.key
                      ? const Color.fromRGBO(144, 144, 144, 1)
                      : const Color.fromRGBO(242, 242, 242, 1)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
