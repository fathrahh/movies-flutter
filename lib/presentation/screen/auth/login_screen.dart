import 'package:filmio/common_widgets/common_gradient.dart';
import 'package:filmio/common_widgets/gradient_text.dart';
import 'package:filmio/common_widgets/gradient_text_field.dart';
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
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          const SizedBox(
            height: 16,
          ),
          const GradientBorderTextField(),
          const SizedBox(
            height: 16,
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
