import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/pages/basket_page.dart';
import 'package:suxoy_zakon/pages/menu_page.dart';
import 'package:suxoy_zakon/pages/profile_page.dart';
import 'package:suxoy_zakon/pages/successflu_order_page.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final screens = [
    const MenuPage(),
    const ProfilePage(),
    const BasketPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).shadowColor,
          unselectedItemColor: Theme.of(context).dividerColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedIndex == 0
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  Positioned(
                    left: 8,
                    top: 9,
                    child: SvgPicture.asset('assets/first.svg'),
                  ),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedIndex == 1
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  Positioned(
                    left: 12,
                    top: 9,
                    child: SvgPicture.asset('assets/second.svg'),
                  ),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedIndex == 2
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  Positioned(
                    top: 6,
                    left: 7,
                    child: SvgPicture.asset('assets/third.svg'),
                  ),
                ],
              ),
              label: "",
            ),
          ],
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
      ),
    );
  }
}
