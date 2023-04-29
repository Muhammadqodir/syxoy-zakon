import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/alt_btn.dart';
import 'package:suxoy_zakon/widgets/cart_item_widget.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_select.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';
import 'package:suxoy_zakon/widgets/recipe.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int count = 0;

  String phone = "";
  String userName = "";

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  _fillData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone") ?? "Undefined";
    userName = preferences.getString("fullName") ?? "Undefined";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Positioned(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ActionBtn(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              accentColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              icon: const Icon(
                                CupertinoIcons.arrow_left,
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Аккаунт",
                                style: Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: primaryColor.withAlpha(40),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                CupertinoIcons.person,
                                color: primaryColor,
                                size: 42,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          phone,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          controller: TextEditingController(),
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Введите ваше имя",
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          controller: TextEditingController(),
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Номер телефона",
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomSelect(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Ваш пол",
                          style: "normal",
                          items: const ["Мужской", "Женский"],
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          controller: TextEditingController(),
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Дата рождения",
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBtn(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                              onTap: () {},
                              text: "Сохранить",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
