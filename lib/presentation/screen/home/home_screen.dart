import 'package:filmio/presentation/screen/home/widgets/home_carousel.dart';
import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
      padding:
          EdgeInsets.fromLTRB(0, MediaQuery.of(context).viewPadding.top, 0, 0),
      child: Column(children: <Widget>[
        HomeCarousel(imgSrc: imgSrc),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Most Popular Movies',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
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
                          onTap: () => Navigator.pushNamed(context, "/login"),
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
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
