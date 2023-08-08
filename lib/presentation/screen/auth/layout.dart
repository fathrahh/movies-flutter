import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  final List<InlineSpan> title;
  final String? subtitle;
  final String backIconsAsset = "assets/icons/chevron-left.svg";

  const AuthLayout({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(
            vertical: 32.0,
            horizontal: 16.0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - (32.0),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    backIconsAsset,
                    height: 24,
                    width: 24,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                      children: title,
                    ),
                  ),
                  subtitle != null
                      ? Column(
                          children: [
                            const SizedBox(height: 8),
                            Text(subtitle!),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 36),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
