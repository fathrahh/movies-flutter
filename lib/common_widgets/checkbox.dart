import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? value;
  final void Function(bool?) onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: (widget.value ?? false)
                    ? const [
                        BoxShadow(
                            color: Colors.black, blurRadius: 4, spreadRadius: 0)
                      ]
                    : [],
                color: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              value: widget.value,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
