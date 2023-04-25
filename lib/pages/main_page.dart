import 'package:flutter/material.dart';
import 'package:suxoy_zakon/pages/contents/content_main.dart';
import 'package:suxoy_zakon/pages/test.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: ContentMain(),
    );
  }
}