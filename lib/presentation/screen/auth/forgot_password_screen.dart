import 'package:filmio/common_widgets/gradient_button.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/gradient_text_field_form.dart';
import 'package:filmio/presentation/screen/auth/layout.dart';

import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: const [
        TextSpan(text: "Uh-oh, lost your password?"),
      ],
      subtitle:
          "We're here to save the day! Just enter your email and we'll take care of the rest",
      children: [
        const GradientBorderTextField(
          hintText: "Enter your email",
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(),
              children: [
                const TextSpan(text: "Remember Password? "),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: const GradientText(
                      "Sign in",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 70,
                child: GradientButton(
                  text: "Reset Password",
                  onPressed: () =>
                      Navigator.pushNamed(context, "/verification"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
