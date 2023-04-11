import 'package:flutter/material.dart';
import 'package:suxoy_zakon/forms/register_form.dart';
import 'package:suxoy_zakon/models/form_data.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterForm form = RegisterForm();

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
              form,
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
              CustomBtn(
                onTap: () {
                  FormDataModel model = form.validateForm();
                  if(model.isValid){
                    //Do something
                  }else{
                    Dialogs.showAlertDialog(context, "Ошибка", model.message);
                  }
                },
                text: "Зарегистрироваться",
              ),
              CustomBtn(
                onTap: () {},
                padding: const EdgeInsets.all(0),
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
