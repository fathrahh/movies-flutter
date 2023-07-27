import 'package:filmio/common_widgets/common_gradient.dart';
import 'package:filmio/common_widgets/diveder_text.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/gradient_text_field_form.dart';
import 'package:filmio/presentation/screen/auth/layout.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      TextSpan(text: "Experience "),
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GradientText(
            "Filmio ",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
            gradient: gradientYY,
          )),
      TextSpan(text: "by creating your account today!")
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
          Container(
            child: CheckboxListTile(
              value: true,
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(
                      text: "By signuing up, you agree to our ",
                    ),
                    TextSpan(
                      text: "Terms of Service",
                    ),
                    TextSpan(
                      text: " and ",
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                    ),
                  ],
                ),
              ),
              onChanged: (a) {},
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              )),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
            ),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: gradientYY,
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const DivederText(
            text: "Or",
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {},
            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Logo Here "),
                    Text("Sign up with Google"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(children: [
              const TextSpan(text: "Already have an account? "),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/login"),
                  child: const GradientText(
                    "Sign in",
                    gradient: gradientYY,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    ]);
  }
}
