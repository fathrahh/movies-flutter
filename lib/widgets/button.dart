import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const Button({super.key, required this.buttonText, required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.indigo.shade400),
      ),
      onPressed: widget.onPressed,
      child:
          Text(widget.buttonText, style: const TextStyle(color: Colors.white)),
    );
  }
}
