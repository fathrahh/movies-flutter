import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleCheckbox,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: isChecked
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      spreadRadius: 2)
                ]
              : [],
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? Colors.blue : Colors.transparent,
                border:
                    isChecked ? null : Border.all(color: Colors.grey, width: 2),
              ),
              child: isChecked
                  ? const Icon(Icons.check, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 10),
            const Text('Checkbox Label'),
          ],
        ),
      ),
    );
  }
}
