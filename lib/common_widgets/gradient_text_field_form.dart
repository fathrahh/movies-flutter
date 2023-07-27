import "package:filmio/common_widgets/common_gradient.dart";
import "package:flutter/material.dart";

class GradientBorderTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const GradientBorderTextField({
    super.key,
    this.hintText = "Enter Text...",
    this.obscureText = false,
    this.controller,
  });

  @override
  State<GradientBorderTextField> createState() =>
      _GradientBorderTextFieldState();
}

class _GradientBorderTextFieldState extends State<GradientBorderTextField> {
  final BorderRadius _borderRadius = BorderRadius.circular(16.0);

  late FocusNode textEditingFocusNode;
  double _padding = 0;

  @override
  void initState() {
    super.initState();
    textEditingFocusNode = FocusNode();
    textEditingFocusNode.addListener(_onChangeFocus);
  }

  @override
  void dispose() {
    textEditingFocusNode.dispose();
    textEditingFocusNode.removeListener(_onChangeFocus);

    super.dispose();
  }

  void _onChangeFocus() {
    setState(() {
      if (textEditingFocusNode.hasFocus) {
        _padding = 2.0;
        return;
      }
      _padding = 0;
    });
  }

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
            ),
          ),
          AnimatedPadding(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(_padding),
            child: Container(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: _borderRadius),
              child: TextFormField(
                controller: widget.controller,
                focusNode: textEditingFocusNode,
                obscureText: widget.obscureText,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
