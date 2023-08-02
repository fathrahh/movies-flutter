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
              height: 525,
              viewportFraction: 0.8,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (idx, reason) {
                setCurrentHighlight(idx);
              }),
          items: widget.imgSrc.asMap().entries.map((item) {
            return Builder(builder: (BuildContext context) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.black87,
                    child: Image.asset(
                      'images/${item.value}',
                      fit: BoxFit.fitHeight,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
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
