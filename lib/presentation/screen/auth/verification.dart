import 'package:filmio/common_widgets/gradient_button.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/otp_field.dart';
import 'package:filmio/presentation/screen/auth/layout.dart';

import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
        TextSpan(text: "Let's verify your account"),
      ],
      subtitle:
          "To complete your account setup, enter the 4-digit OTP code we sent to you",
      children: [
        const OTPField(
          length: 4,
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(),
              children: [
                const TextSpan(text: "Didn't receive code? "),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: const GradientText(
                      "Resend code",
                    ),
                  ),
                ),
                const TextSpan(text: " in 59 seconds"),
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
                  text: "verify",
                  onPressed: () => Navigator.pushNamed(context, '/'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
