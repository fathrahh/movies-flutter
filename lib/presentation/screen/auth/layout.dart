import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  final List<InlineSpan> title;
  final String? subtitle;
  final String backIconsAsset = "assets/icons/arrow-left.svg";

  const AuthLayout({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewPadding.top + 32.0,
              horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )),
                child: SvgPicture.asset(
                  backIconsAsset,
                  height: 24,
                  width: 24,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                      children: title)),
              const SizedBox(height: 36),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
