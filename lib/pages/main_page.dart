import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/pages/cart_page.dart';
import 'package:suxoy_zakon/pages/contents/content_cart.dart';
import 'package:suxoy_zakon/pages/contents/content_main.dart';
import 'package:suxoy_zakon/pages/contents/content_profile.dart';
import 'package:suxoy_zakon/pages/contents/not_logged_in.dart';
import 'package:suxoy_zakon/pages/test.dart';
import 'package:suxoy_zakon/widgets/bottom_nav.dart';
import 'package:suxoy_zakon/widgets/fade_indexed_stack.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<CustomBottomNavItem> items = [
    CustomBottomNavItem(
      "Меню",
      CupertinoIcons.circle_grid_3x3,
    ),
    CustomBottomNavItem(
      "Профиль",
      CupertinoIcons.person,
    ),
    CustomBottomNavItem(
      "Корзина",
      CupertinoIcons.cart,
    ),
  ];

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  bool isLogin = false;
  checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLogin = sharedPreferences.getBool("isLogin") ?? false;
    log(isLogin.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: FadeIndexedStack(index: selectedIndex, children: [
        const ContentMain(),
        isLogin ? ContentProfile() : const NotLoggedIn(),
        isLogin ? ContentCart() : const NotLoggedIn(),
      ]),
      bottomNavigationBar: CustomBottomNav(
        selIndex: selectedIndex,
        items: items,
        onChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
