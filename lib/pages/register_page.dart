import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/forms/register_form.dart';
import 'package:suxoy_zakon/models/form_data.dart';
import 'package:suxoy_zakon/pages/confirmation_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterForm form = RegisterForm(
    initPhone: "9682659013",
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLogin = false;

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
                isLogin: isLogin,
                onTap: () async {
                  setState(() {
                    isLogin = true;
                  });
                  FormDataModel model = form.validateForm();
                  if (model.isValid) {
                    // Dialogs.showAlertDialog(context, "Phone", model.data);
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: model.data,
                      verificationCompleted: (
                        PhoneAuthCredential credential,
                      ) {},
                      verificationFailed: (FirebaseAuthException e) {
                        setState(() {
                          isLogin = false;
                        });
                        log("Authorized failed${e.message}");
                        if (e.code == 'invalid-phone-number') {
                          Dialogs.showAlertDialog(
                            context,
                            "Ошибка",
                            "Неверный формат номера телефона.",
                          );
                        } else {
                          Dialogs.showAlertDialog(
                              context, "Ошибка", e.message.toString());
                        }
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        setState(() {
                          isLogin = false;
                        });
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ConfirmationPage(
                              auth: auth,
                              verificationId: verificationId,
                              phone: model.data,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  } else {
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
