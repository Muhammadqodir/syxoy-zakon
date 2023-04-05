import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_select.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';

class ProfileDataPage extends StatefulWidget {
  const ProfileDataPage({super.key});

  @override
  State<ProfileDataPage> createState() => _ProfileDataPageState();
}

class _ProfileDataPageState extends State<ProfileDataPage> {
  final colortextfield = const Color(0x64FFFFFF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: SizedBox(
                      height: 55,
                      width: 55,
                      child: CustomActionButton(
                        accentcolor: Theme.of(context).scaffoldBackgroundColor,
                        color: Theme.of(context).dividerColor,
                        icon: Icons.arrow_back,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                "Имя Фамилия",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  elevation: 1.5,
                  child: CustomTextField(
                    baseColor: colortextfield,
                    borderRadius: BorderRadius.circular(2),
                    controller: TextEditingController(),
                    onChanged: (v) {},
                    hint: "Введите ваше имя",
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat-light",
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  elevation: 1.5,
                  child: CustomTextField(
                    baseColor: colortextfield,
                    borderRadius: BorderRadius.circular(2),
                    controller: TextEditingController(),
                    onChanged: (v) {},
                    hint: "Введите вашу фамилию",
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat-light",
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  elevation: 1,
                  child: CustomTextField(
                    baseColor: colortextfield,
                    borderRadius: BorderRadius.circular(2),
                    controller: TextEditingController(),
                    onChanged: (v) {},
                    hint: "Введите ваш номер телефона",
                    hintStyle: TextStyle(
                      fontFamily: "Montserrat-light",
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  elevation: 1.5,
                  child: CustomSelect(
                    hint: "Введите ваш пол",
                    baseColor: colortextfield,
                    borderRadius: BorderRadius.circular(2),
                    onChanged: (v) {},
                    items: const [
                      "Мужской",
                      "Женский",
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  elevation: 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).dividerColor),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      hintText: "Дата рождения",
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat-light",
                        color: Theme.of(context).dividerColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                  ),
                  child: CustomBtn(
                    onTap: () {},
                    text: "Обновить данные",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
