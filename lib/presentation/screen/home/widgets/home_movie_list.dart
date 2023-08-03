import "package:flutter/material.dart";

class HomeMovieList extends StatelessWidget {
  const HomeMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            separatorBuilder: (context, _) => const SizedBox(width: 8),
            itemBuilder: (context, idx) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/login"),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
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
    );
  }
}
