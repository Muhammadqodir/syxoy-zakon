import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/pages/orders_page.dart';
import 'package:suxoy_zakon/pages/profile_page.dart';
import 'package:suxoy_zakon/pages/register_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';
import 'package:suxoy_zakon/widgets/prefs_item.dart';
import 'package:suxoy_zakon/widgets/profile_widget.dart';

class ContentProfile extends StatefulWidget {
  const ContentProfile({super.key});

  @override
  State<ContentProfile> createState() => _ContentProfileState();
}

class _ContentProfileState extends State<ContentProfile> {
  @override
  void initState() {
    super.initState();
    _fillData();
  }

  String phone = "";
  String userName = "";

  _fillData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    phone = preferences.getString("phone") ?? "Undefined";
    userName = preferences.getString("fullName") ?? "Undefined";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          ProfileWidget(
            phone: phone,
            userName: userName,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                PrefsItem(
                  onTap: () async {
                    String token = (await SharedPreferences.getInstance())
                            .getString("token") ??
                        "undefined";
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProfilePage(
                          api: Api(
                            token: token,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: CupertinoIcons.person,
                  title: "Мой аккаунт",
                  desc: "Редактировать информацию",
                ),
                const SizedBox(
                  height: 24,
                ),
                PrefsItem(
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => OrdersPage(
                          api: Api(
                            token:
                                preferences.getString("token") ?? "undefined",
                          ),
                        ),
                      ),
                    );
                  },
                  icon: CupertinoIcons.cart,
                  title: "История заказов",
                  desc: "Посмотреть историю заказов",
                ),
                const SizedBox(
                  height: 24,
                ),
                PrefsItem(
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.setBool("isLogin", false);
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  icon: CupertinoIcons.square_arrow_left,
                  title: "Выйти",
                  desc: "Выйти с аккаунта",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
