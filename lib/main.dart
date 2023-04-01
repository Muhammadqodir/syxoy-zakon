import 'package:flutter/material.dart';
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
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            CustomBtn(
              margin: const EdgeInsets.all(12),
              onTap: () {},
              text: "test",
            ),
            CustomTextField(
              margin: const EdgeInsets.all(12),
              controller: TextEditingController(),
              hint: "test",
              onChanged: (v) {},
            ),
            CustomSelect(
              margin: const EdgeInsets.all(12),
              onChanged: (v) {},
              baseColor: Theme.of(context).scaffoldBackgroundColor,
              hint: "Select country",
              items: ["Россия (+7)", "Узбекискан (+998)"],
            )
          ],
        )),
      ),
    );
  }
}
