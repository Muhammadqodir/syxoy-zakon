import 'package:flutter/material.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/pages/confirmation_page.dart';
import 'package:suxoy_zakon/pages/main_page.dart';
import 'package:suxoy_zakon/pages/onboarding_page.dart';
import 'package:suxoy_zakon/pages/product_page.dart';
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
      home: ProductPage(
        position: MenuItem(
          title: "Блинчик с ветчиной и сыром",
          desc: "Блинчик с ветчиной и сыром",
          imageUrl:
              "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
          price: "299",
        ),
      ),
    );
  }
}
