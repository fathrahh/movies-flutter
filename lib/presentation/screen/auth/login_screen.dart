import 'package:filmio/common_widgets/common_gradient.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/gradient_text_field_form.dart';
import 'package:filmio/presentation/screen/auth/layout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                child: CheckboxListTile(
                  value: true,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: RichText(
                    text: const TextSpan(
                        style: TextStyle(fontSize: 14),
                        text: "Remember your password"),
                  ),
                  onChanged: (a) {},
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/sign-up"),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 14),
                    text: "Forgot your password ?",
                  ),
                ),
              ),
            ],
          ),
          Text(_controller.value.text),
          Row(children: <Widget>[
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Login')))
          ])
        ],
      ),
    ]);
  }
}
