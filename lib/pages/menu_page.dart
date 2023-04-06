import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_count.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';
import 'package:suxoy_zakon/widgets/custom_total_price.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 320,
                      top: 30,
                    ),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/third.svg'),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 160,
                    margin: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 130,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Theme.of(context).dividerColor,
                          blurRadius: 1,
                        ),
                      ],
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Сухой ЗаконЪ',
                        style: TextStyle(
                          fontFamily: "PlayfairBold",
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  baseColor: Theme.of(context).scaffoldBackgroundColor,
                  controller: TextEditingController(),
                  hint: "найди себе блюдо",
                  onChanged: (v) {},
                  hintStyle: const TextStyle(
                    fontFamily: "Montserrat-light",
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultTabController(
                length: 4,
                animationDuration: const Duration(milliseconds: 100),
                child: Column(
                  children: [
                    Material(
                      child: Container(
                        height: 60,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: TabBar(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 10,
                            top: 10,
                          ),
                          isScrollable: true,
                          physics: const ClampingScrollPhysics(),
                          unselectedLabelColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: Theme.of(context).shadowColor,
                          ),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Theme.of(context).primaryColor,
                          ),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      "Блины",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      "Бургеры",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      "Гренки",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      "Картошечные",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x64302F3C),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image1.png',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Блинчик с ветчиной и сыром",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomPriceCounter(
                                      width: 150,
                                      initialValue: 105,
                                      onChanged: (v) {},
                                      color: Theme.of(context).shadowColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x64302F3C),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image1.png',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Блинчик с ветчиной и сыром",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomPriceCounter(
                                      width: 150,
                                      initialValue: 105,
                                      onChanged: (v) {},
                                      color: Theme.of(context).shadowColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x64302F3C),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image1.png',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Блинчик с ветчиной и сыром",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomPriceCounter(
                                      width: 150,
                                      initialValue: 105,
                                      onChanged: (v) {},
                                      color: Theme.of(context).shadowColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x64302F3C),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image1.png',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Блинчик с ветчиной и сыром",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomPriceCounter(
                                      width: 150,
                                      initialValue: 105,
                                      onChanged: (v) {},
                                      color: Theme.of(context).shadowColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
