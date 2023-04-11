import 'package:flutter/material.dart';
import 'package:suxoy_zakon/pages/confirmation_page.dart';
import 'package:suxoy_zakon/pages/main_page.dart';
import 'package:suxoy_zakon/pages/onboarding_page.dart';
import 'package:suxoy_zakon/pages/register_page.dart';
import 'package:suxoy_zakon/pages/splash_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_select.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}