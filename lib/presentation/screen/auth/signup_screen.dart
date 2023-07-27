import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:filmio/common_widgets/common_gradient.dart';
import 'package:filmio/common_widgets/diveder_text.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/gradient_text_field_form.dart';
import 'package:filmio/presentation/screen/auth/layout.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final String googleIcon = "assets/icons/Google.svg";
  late TextEditingController _controller;
  bool? _cbTerm = false;

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

  void toggleCb(bool? cb) {
    setState(() => _cbTerm = cb);
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
            hintText: "Enter Your Email",
          ),
          const SizedBox(
            height: 16,
          ),
          const GradientBorderTextField(
            hintText: "Enter Your Number Phone",
          ),
          const SizedBox(
            height: 16,
          ),
          const GradientBorderTextField(
            hintText: "Create Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 16,
          ),
          const GradientBorderTextField(
            hintText: "Confirm Your Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: (_cbTerm ?? false)
                              ? const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 4,
                                      spreadRadius: 0)
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
                        value: _cbTerm,
                        onChanged: toggleCb,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: "By signing up, you agree to our ",
                      ),
                      WidgetSpan(
                        child: GradientText(
                          "Terms of Service",
                          gradient: gradientYY,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                      ),
                      WidgetSpan(
                        child: GradientText(
                          "Privacy Policy",
                          gradient: gradientYY,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(googleIcon),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text("Sign up with Google"),
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
