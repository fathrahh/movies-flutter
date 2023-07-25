import "package:filmio/common_widgets/common_gradient.dart";
import "package:flutter/material.dart";

class GradientBorderTextField extends StatefulWidget {
  const GradientBorderTextField({super.key});

  @override
  _GradientBorderTextFieldState createState() =>
      _GradientBorderTextFieldState();
}

class _GradientBorderTextFieldState extends State<GradientBorderTextField> {
  final BorderRadius _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: gradientYY,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: _borderRadius),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text...',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
