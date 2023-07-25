import 'package:filmio/common_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentHighlight = 0;
  CarouselController higlightCarouselController = CarouselController();

  void setCurrentHighlight(int currentHighlight) {
    setState(() {
      _currentHighlight = currentHighlight;
    });
  }

  final List<String> imgSrc = [
    "twilight.jpeg",
    "quantum_poster.jpg",
    "Avatar.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(25, 24, 37, 1),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Stack(children: [
              CarouselSlider(
                  carouselController: higlightCarouselController,
                  options: CarouselOptions(
                      height: 525,
                      viewportFraction: 1,
                      autoPlay: true,
                      onPageChanged: (idx, reason) {
                        setCurrentHighlight(idx);
                      }),
                  items: imgSrc.asMap().entries.map((item) {
                    return Builder(builder: (BuildContext context) {
                      return Image.asset(
                        'images/${item.value}',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      );
                    });
                  }).toList()),
              const Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(25, 24, 37, 1),
                      ],
                      radius: 1.2,
                    )),
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 20,
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(buttonText: "Watch Me", onPressed: () {}),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        constraints: BoxConstraints.tight(const Size(40, 40)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero, // Set padding to zero
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgSrc.asMap().entries.map((item) {
                        return GestureDetector(
                          onTap: () => higlightCarouselController
                              .animateToPage(item.key),
                          child: Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: (_currentHighlight == item.key
                                    ? Colors.white
                                    : Colors.grey),
                                shape: BoxShape.circle),
                          ),
                        );
                      }).toList()),
                ]),
              ),
            ]),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Most Popular Movies',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, idx) {
                            return GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, "/login"),
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
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
                ]))
          ]),
        ));
  }
}
