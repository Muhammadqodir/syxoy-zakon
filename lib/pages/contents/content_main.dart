import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_tabs.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';
import 'package:suxoy_zakon/widgets/menu_position.dart';

class ContentMain extends StatefulWidget {
  const ContentMain({super.key});

  @override
  State<ContentMain> createState() => _ContentMainState();
}

class _ContentMainState extends State<ContentMain> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            getBgCover(),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ActionBtn(
                              onTap: () {},
                              accentColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              icon: SvgPicture.asset(
                                "assets/cart.svg",
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        Container(
                          height: 167,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Сухой ЗаконЪ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontSize: 26),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomBtn(
                          onTap: () {},
                          height: 40,
                          accentColor: const Color(0xFFF9F9F9),
                          text: "найди себе блюдо",
                          alignment: MainAxisAlignment.start,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: textColor.withOpacity(0.7)),
                          icon: Icon(
                            CupertinoIcons.search,
                            size: 20,
                            color: textColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTabs(
                    tabs: const [
                      "Блины",
                      "Бургеры",
                      "Гренки",
                      "Картофель",
                      "Пицца"
                    ],
                    onChanged: (index) {},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MenuPosition(
                                position: MenuItem(
                                  title: "Блинчик с ветчиной и сыром",
                                  desc: "Блинчик с ветчиной и сыром",
                                  imageUrl:
                                      "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
                                  price: "299",
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: MenuPosition(
                                position: MenuItem(
                                  title: "Блинчик с ветчиной и сыром",
                                  desc: "Блинчик с ветчиной и сыром",
                                  imageUrl:
                                      "https://i.pinimg.com/564x/8d/31/2c/8d312ca14b4bbbfbd7ed52d6f51fc371.jpg",
                                  price: "299",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox getBgCover() {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.network(
              'https://static1.squarespace.com/static/53b839afe4b07ea978436183/53bbeeb2e4b095b6a428a13e/5fd2570b51740e23cce97919/1678505081247/traditional-food-around-the-world-Travlinmad.jpg?format=1500w'),
        ),
      ),
    );
  }
}
