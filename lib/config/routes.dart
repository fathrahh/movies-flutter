import 'package:filmio/presentation/screen/auth/forgot_password_screen.dart';
import 'package:filmio/presentation/screen/auth/login_screen.dart';
import 'package:filmio/presentation/screen/auth/signup_screen.dart';
import 'package:filmio/presentation/screen/auth/verification.dart';
import 'package:filmio/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

final routes = {
  ...appRoutes,
  ...authRoutes,
};

Map<String, Widget Function(BuildContext)> authRoutes = {
  '/login': (context) => const LoginPage(),
  '/sign-up': (context) => const SignUpPage(),
  '/forgot-password': (context) => const ForgotPasswordPage(),
  '/verification': (context) => const VerificationPage(),
};

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const MyHomePage(title: "flutter App"),
};
