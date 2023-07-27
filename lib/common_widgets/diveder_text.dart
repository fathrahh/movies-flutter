import 'package:flutter/material.dart';

class DivederText extends StatelessWidget {
  final String text;

  const DivederText({
    super.key,
    this.text = "Example",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: const Divider(
                color: Colors.white,
                height: 50,
              )),
        ),
        Text(text),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: const Divider(
                color: Colors.white,
                height: 50,
              )),
        ),
      ],
    );
  }
}
