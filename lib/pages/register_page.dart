import 'package:flutter/material.dart';
import 'package:suxoy_zakon/forms/register_form.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Добро пожаловать в\nприложение Сухой ЗаконЪ",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: "MontserratBold"),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Мы позвоним или напишем вам, чтобы подтвердить ваш номер. Вы получите код. Пожалуйста, никому не сообщайте его!",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: textColor.withOpacity(0.8),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              RegisterForm(),
              const SizedBox(
                height: 12,
              ),
              CustomBtn(
                onTap: () {},
                text: "Зарегистрироваться",
              ),
              CustomBtn(
                onTap: () {},
                padding: EdgeInsets.all(0),
                accentColor: Theme.of(context).scaffoldBackgroundColor,
                textColor: textColor.withOpacity(0.8),
                text: "Посмотреть меню",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
