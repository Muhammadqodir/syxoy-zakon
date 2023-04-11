import 'package:flutter/material.dart';
import 'package:suxoy_zakon/pages/contents/content_main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: ContentMain(),
    );
  }
}