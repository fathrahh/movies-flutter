import 'package:filmio/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    this.text = "Example",
    this.prefixIcon,
    this.prefix,
    this.sufficIcon,
    this.textStyle,
    this.backgroundColor = ThemeColors.primary,
    this.onTap,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;
  final String text;
  final Widget? prefixIcon;
  final Widget? sufficIcon;
  final Widget? prefix;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraints(minHeight: 24),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: ThemeColors.primary.shade50.withOpacity(0.2),
            child: Padding(
              padding: padding != null
                  ? padding!
                  : const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prefixIcon != null ? prefixIcon! : Container(),
                  if (prefix != null) prefix!,
                  Text(
                    text,
                    style: TextStyle(
                      color: ThemeColors.primary.shade50,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ).merge(textStyle),
                  ),
                  sufficIcon != null ? sufficIcon! : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
