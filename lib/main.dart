import 'package:filmio/presentation/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:filmio/presentation/screen/home/home_screen.dart';
import 'package:filmio/config/theme.dart';
import 'package:filmio/presentation/screen/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        initialRoute: '/login',
        routes: {
          '/': (context) => const MyHomePage(title: "flutter App"),
          '/login': (context) => const LoginPage(),
          '/sign-up': (context) => const SignUpPage(),
        });
  }
}
