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
        Column(
          children: <Widget>[
            const GradientBorderTextField(
              hintText: "Enter your email",
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(),
                children: [
                  TextSpan(text: "New to Filmio? "),
                  WidgetSpan(
                    child: GradientText(
                      "Sign up now",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            const GradientButton(
              text: "Sign in",
            ),
          ],
        ),
      ],
    );
  }
}
