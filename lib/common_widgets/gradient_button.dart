import 'package:filmio/common_widgets/common_gradient.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final Gradient gradient;
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  const GradientButton({
    super.key,
    this.gradient = gradientYY,
    this.text = "Example..",
    this.textStyle,
    this.onPressed,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        )),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: const BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 36.0,
          ), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
            ).merge(widget.textStyle),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
