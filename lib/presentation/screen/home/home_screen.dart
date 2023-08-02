import 'package:filmio/presentation/screen/home/widgets/home_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(233, 233, 234, 1),
              width: .5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset("assets/icons/home-outline.svg"),
            ),
            BottomNavigationBarItem(
              label: 'Watchlist',
              icon: SvgPicture.asset("assets/icons/watchlist.svg"),
            ),
            BottomNavigationBarItem(
              label: 'Seatch',
              icon: SvgPicture.asset("assets/icons/download.svg"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).viewPadding.top + 24, 0, 0),
        child: Column(
          children: <Widget>[
            HomeCarousel(imgSrc: imgSrc),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Most Popular Movies',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (context, _) =>
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
