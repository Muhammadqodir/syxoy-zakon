import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/models/user.dart';
import 'package:suxoy_zakon/pages/main_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';

class ConfirmationPage extends StatefulWidget {
  ConfirmationPage({
    super.key,
    required this.auth,
    required this.verificationId,
    required this.phone,
  });

  final FirebaseAuth auth;
  final String verificationId;
  final String phone;

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final Color scaffoldBackgroundColor = const Color(0xFFF9F9F9);

  final pinController = TextEditingController();
  bool isLoading = false;

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
                    selectedColor: textColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomBtn(
                isLogin: isLoading,
                onTap: () async {
                  String pin = pinController.text;
                  log(pin);
                  if (pin.length == 6) {
                    setState(() {
                      isLoading = true;
                    });
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: pin,
                    );
                    try {
                      UserCredential user =
                          await widget.auth.signInWithCredential(credential);
                      Response<UserModel> data =
                          await Api().register(widget.phone);
                      if (data.success) {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        preferences.setBool("isLogin", true);
                        preferences.setString("token", data.data!.token);
                        preferences.setString("phone", data.data!.phone);
                        preferences.setString("fullName", data.data!.fullName);
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                        // Dialogs.showAlertDialog(
                        //   context,
                        //   "Failed",
                        //   data.data!.token ?? "data",
                        // );
                      } else {
                        Dialogs.showAlertDialog(
                          context,
                          "Failed",
                          data.message,
                        );
                      }
                      setState(() {
                        isLoading = true;
                      });
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
                  Navigator.pop(context);
                },
                textColor: primaryColor,
                accentColor: scaffoldBackgroundColor,
                text: "Изменить номер",
              )
            ],
          ),
        ),
      ),
    );
  }
}
