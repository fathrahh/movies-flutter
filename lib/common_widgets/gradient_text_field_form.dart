import "package:filmio/common_widgets/common_gradient.dart";
import "package:flutter/material.dart";

class GradientBorderTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const GradientBorderTextField({
    super.key,
    this.hintText = "Enter Text...",
    this.obscureText = false,
    this.controller,
    this.focusNode,
  });

  @override
  State<GradientBorderTextField> createState() =>
      _GradientBorderTextFieldState();
}

class _GradientBorderTextFieldState extends State<GradientBorderTextField> {
  final BorderRadius _borderRadius = BorderRadius.circular(16.0);
  late FocusNode textEditingFocusNode;
  bool _obsecureText = false;
  double _padding = 0;

  @override
  void initState() {
    super.initState();
    textEditingFocusNode = widget.focusNode ?? FocusNode();
    textEditingFocusNode.addListener(_onChangeFocus);
    _obsecureText = widget.obscureText;
  }

  @override
  void dispose() {
    textEditingFocusNode.dispose();
    textEditingFocusNode.removeListener(_onChangeFocus);

    super.dispose();
  }

  void _obSecureToggle() => setState(() => _obsecureText = !_obsecureText);

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
                style: const TextStyle(color: Colors.black),
                controller: widget.controller,
                focusNode: textEditingFocusNode,
                obscureText: _obsecureText,
                decoration: InputDecoration(
                  suffixIcon: widget.obscureText
                      ? IconButton(
                          splashRadius: 20.0,
                          onPressed: _obSecureToggle,
                          icon: Icon(_obsecureText
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                        )
                      : null,
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
