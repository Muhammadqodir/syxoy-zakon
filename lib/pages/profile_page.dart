import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/models/profile.dart';
import 'package:suxoy_zakon/pages/onboarding_page.dart';
import 'package:suxoy_zakon/pages/register_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/alt_btn.dart';
import 'package:suxoy_zakon/widgets/cart_item_widget.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_select.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';
import 'package:suxoy_zakon/widgets/recipe.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.api});

  final Api api;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int count = 0;

  String phone = "";
  String userName = "";
  TextEditingController _userNameContoller = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _birthDayContoller = TextEditingController();
  String sex = "Мужчина";

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  _fillData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone") ?? "Undefined";
    userName = preferences.getString("fullName") ?? "Undefined";
    Response<Profile> response = await widget.api.getMyProfile();
    if (response.success) {
      if (response.data!.name != "undefined") {
        _userNameContoller.text = response.data!.name;
      }
      if (response.data!.birthDay != "undefined") {
        _birthDayContoller.text = response.data!.birthDay;
      }
      if (response.data!.phone != "undefined") {
        _phoneNumberController.text = response.data!.phone;
      }
      if (response.data!.sex != "undefined") {
        sex = response.data!.sex;
      }
    } else {
      Dialogs.showAlertDialog(context, "Ошибка", response.message);
    }
    setState(() {});
  }

  bool isLoading = false;

  _saveProfile() async {
    setState(() {
      isLoading = true;
    });
    if (_userNameContoller.text.isNotEmpty &&
        _birthDayContoller.text.isNotEmpty) {
      Response<Profile> response = await widget.api
          .saveUser(_userNameContoller.text, _birthDayContoller.text, sex);
      if (response.success) {
        Dialogs.showAlertDialog(context, "Сухой законъ", "Готово!");
      } else {
        Dialogs.showAlertDialog(context, "Сухой законъ", response.message);
      }
    } else {
      Dialogs.showAlertDialog(context, "Сухой законъ", "Заполните все поля");
    }
    setState(() {
      isLoading = false;
    });
  }

  _deleteProfile() async {
    setState(() {
      isLoading = true;
    });
    Response<bool> response = await widget.api.deleteProfile();
    if (response.success) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool("isLogin", false);
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => OnboardingPage(),
        ),
      );
    }else{
      Dialogs.showAlertDialog(context, "Ошибка", response.message);
    }
    setState(() {
      isLoading = false;
    });
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
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
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
                          controller: _userNameContoller,
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Введите ваше имя",
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          controller: _phoneNumberController,
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Номер телефона",
                          enabled: false,
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CupertinoSegmentedControl<String>(
                          selectedColor: primaryColor,
                          borderColor: primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          groupValue: sex,
                          onValueChanged: (String value) {
                            setState(() {
                              sex = value;
                            });
                          },
                          children: const <String, Widget>{
                            "Мужчина": Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Text('Мужчина'),
                            ),
                            "Женшина": Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Text('Женшина'),
                            )
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          controller: _birthDayContoller,
                          baseColor: Colors.black12.withAlpha(10),
                          hint: "Дата рождения",
                          inputType: TextInputType.number,
                          inputFormatter: [
                            MaskTextInputFormatter(
                              mask: '##.##.####',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy,
                            )
                          ],
                          onChanged: (v) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBtn(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              isLogin: isLoading,
                              onTap: _saveProfile,
                              icon: const Icon(
                                CupertinoIcons.check_mark_circled,
                                color: Colors.white,
                              ),
                              text: "Сохранить",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomBtn(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          isLogin: isLoading,
                          accentColor: Colors.transparent,
                          textColor: Colors.red,
                          onTap: _deleteProfile,
                          icon: const Icon(
                            CupertinoIcons.delete,
                            color: Colors.red,
                          ),
                          text: "Удалить аккаунт",
                        ),
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
