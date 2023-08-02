import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:gradient_borders/gradient_borders.dart";
import "package:filmio/common_widgets/common_gradient.dart";

class OTPField extends StatefulWidget {
  final int length;
  final List<TextEditingController>? controllers;

  const OTPField({
    super.key,
    required this.length,
    this.controllers,
  });

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  List<String> _currentValue = [];

  @override
  void initState() {
    super.initState();
    _controllers = widget.controllers ??
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _currentValue = List.generate(widget.length, (index) => '');
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.length; i++) {
      _controllers[i].dispose();
      _focusNodes[1].dispose();
    }
    super.dispose();
  }

  final InputBorder _gradientBorder = const GradientOutlineInputBorder(
    gradient: gradientYY,
    width: 3,
    borderRadius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) {
          return Row(
            children: [
              index != 0
                  ? const SizedBox(
                      width: 12,
                    )
                  : Container(),
              SizedBox(
                height: 80,
                width: 80,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onChanged: (val) {
                    if (_currentValue[index].isNotEmpty && val.isEmpty) {
                      setState(() => _currentValue[index] = '');
                      debugPrint(_currentValue.toString());
                      _controllers[index].selection;
                      _focusNodes[index - 1 < 0 ? 0 : index - 1].requestFocus();
                      return;
                    }

                    if (val.isNotEmpty) {
                      _controllers[index].text = val[0];
                      _focusNodes[index].unfocus();
                      setState(() => _currentValue[index] = val[0]);
                    }

                    if (index != widget.length - 1) {
                      _focusNodes[index + 1].requestFocus();
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: _gradientBorder,
                    enabledBorder: _controllers[index].text.isNotEmpty
                        ? _gradientBorder
                        : const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                              style: BorderStyle.solid,
                            ),
                          ),
                  ),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
