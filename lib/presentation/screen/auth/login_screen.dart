import 'package:filmio/common_widgets/checkbox.dart';
import 'package:filmio/common_widgets/common_gradient.dart';
import 'package:filmio/common_widgets/diveder_text.dart';
import 'package:filmio/common_widgets/gradient_button.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/gradient_text_field_form.dart';
import 'package:filmio/presentation/screen/auth/layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String googleIcon = "assets/icons/Google.svg";
  late TextEditingController _controller;
  bool? rememberPs = false;

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
    return AuthLayout(title: const [
      TextSpan(text: "Sign in to "),
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GradientText(
            "Filmio ",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
            gradient: gradientYY,
          )),
      TextSpan(text: "to pick up where you left off")
    ], children: [
      Column(
        children: <Widget>[
          const GradientBorderTextField(
            hintText: "Email",
          ),
          const SizedBox(
            height: 16,
          ),
          const GradientBorderTextField(
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CustomCheckbox(
                      value: rememberPs,
                      onChanged: (value) => setState(() => rememberPs = value),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        text: "Remember your password",
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/forgot-password"),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    text: "Forgot your password ?",
                  ),
                ),
              ),
            ],
          ),
          Text(_controller.value.text),
          const GradientButton(
            text: "Sign in",
          ),
          const SizedBox(
            height: 32,
          ),
          const DivederText(
            text: "Or",
          ),
          TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(googleIcon),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  "Sign up with Google",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 180),
          RichText(
            text: TextSpan(
              style: TextStyle(),
              children: [
                const TextSpan(text: "New to Filmio? "),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/sign-up"),
                    child: const GradientText(
                      "Sign up now",
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
