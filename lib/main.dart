import 'package:flutter/material.dart';
import 'package:suxoy_zakon/pages/basket_page.dart';
import 'package:suxoy_zakon/pages/empty_order.dart';
import 'package:suxoy_zakon/pages/food_description_page.dart';
import 'package:suxoy_zakon/pages/main_page.dart';
import 'package:suxoy_zakon/pages/menu_page.dart';
import 'package:suxoy_zakon/pages/onboard_page.dart';
import 'package:suxoy_zakon/pages/order_history_page.dart';
import 'package:suxoy_zakon/pages/order_page.dart';
import 'package:suxoy_zakon/pages/profile_data_page.dart';
import 'package:suxoy_zakon/pages/profile_page.dart';
import 'package:suxoy_zakon/pages/sms_verif_page.dart';
import 'package:suxoy_zakon/pages/splash_page.dart';
import 'package:suxoy_zakon/pages/successflu_order_page.dart';
import 'package:suxoy_zakon/pages/unauthorized_page.dart';
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
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const UnauthorizedPage(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                "Добро пожаловать в приложение Сухой ЗаконЪ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 12),
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.19,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 225,
                          top: 20,
                        ),
                        child: Text(
                          "Код страны",
                          style: TextStyle(
                            fontFamily: 'Montserrat-light',
                            fontSize: 15,
                            color: Theme.of(context).shadowColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SafeArea(
                        child: CustomSelect(
                          baseColor: Theme.of(context).scaffoldBackgroundColor,
                          onChanged: (v) {},
                          items: const [
                            'Россия (+7)',
                            'Узбекистан (+998)',
                            'Кыргызстан (+996)',
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Theme.of(context).dividerColor,
                    ),
                    Expanded(
                      child: SafeArea(
                        child: CustomTextField(
                          hintStyle: TextStyle(
                            fontFamily: "Montserrat-light",
                            fontSize: 16,
                            color: Theme.of(context).dividerColor,
                          ),
                          baseColor: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          controller: TextEditingController(),
                          onChanged: (v) {},
                          hint: "Номер телефона",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Мы позвоним или напишем вам,чтобы подтвердить ваш номер. Вы получите код.Пожалуйста никому не сообщайте его!",
                  style: TextStyle(
                    fontFamily: "Montserrat-light",
                    fontSize: 15,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: CustomBtn(
                onTap: () {},
                text: "Зарегистрироваться",
              ),
            ),
            SafeArea(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Посмотреть меню",
                  style: TextStyle(
                    fontFamily: "Montserrat-light",
                    fontSize: 14,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
