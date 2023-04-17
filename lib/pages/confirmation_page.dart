import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';

class ConfirmationPage extends StatelessWidget {
  ConfirmationPage(
      {super.key, required this.auth, required this.verificationId});

  final Color scaffoldBackgroundColor = const Color(0xFFF9F9F9);
  final pinController = TextEditingController();
  final FirebaseAuth auth;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/sms_verification.svg"),
              Text(
                "Подтвердите аккаунт",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: "MontserratBold"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Пожалуйста введите код, отправленный на ваш номер телефона.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PinCodeTextField(
                  controller: pinController,
                  appContext: context,
                  length: 6,
                  onChanged: (v) {},
                  pinTheme: PinTheme(
                      inactiveColor: primaryColor,
                      activeColor: primaryColor,
                      selectedColor: textColor),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomBtn(
                onTap: () async {
                  String pin = pinController.text;
                  log(pin);
                  if (pin.length == 6) {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: pin,
                    );
                    try {
                      UserCredential user =
                          await auth.signInWithCredential(credential);
                      print(user);
                      Dialogs.showAlertDialog(
                        context,
                        "Success",
                        "Authorized successfuly",
                      );
                    } catch (e) {
                      print(e);
                      Dialogs.showAlertDialog(
                        context,
                        "Failed",
                        "Authorized failed",
                      );
                    }
                  } else {
                    Dialogs.showAlertDialog(
                      context,
                      "Ошибка",
                      "Введите код проверки",
                    );
                  }
                },
                text: "Подтверить",
              ),
              CustomBtn(
                onTap: () {
                  //do something
                },
                textColor: primaryColor,
                accentColor: scaffoldBackgroundColor,
                text: "Отправить код еще раз",
              )
            ],
          ),
        ),
      ),
    );
  }
}
