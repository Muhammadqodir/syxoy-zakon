import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/icon_btn.dart';
import 'package:suxoy_zakon/widgets/menu_position.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';
import 'package:suxoy_zakon/widgets/static_grid.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.position});
  final MenuItem position;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ActionBtn(
                                  onTap: () {},
                                  accentColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  icon: const Icon(
                                    CupertinoIcons.arrow_left,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 230,
                            ),
                            Container(
                              height: 70,
                              width: 158,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 40,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconBtn(
                                    icon: Icon(
                                      CupertinoIcons.minus,
                                      color:
                                          count != 0 ? primaryColor : textColor,
                                    ),
                                    onTap: () {
                                      if (count > 0) {
                                        setState(() {
                                          count--;
                                        });
                                      }
                                    },
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Text(
                                          count.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                fontFamily: "MontserratBold",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconBtn(
                                    icon: const Icon(
                                      CupertinoIcons.plus,
                                      color: primaryColor,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Блинчик с ветчиной и сыром",
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.position.price.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(width: 2,),
                                Text(
                                  "Р",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: primaryColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Состав",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 19),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Ветчина куриная, плавленый сыр, зелень",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 52,
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
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: CustomBtn(
              margin: const EdgeInsets.all(12),
              onTap: () {},
              dropShadow: true,
              text: "Добавить в корзину ( ${priceString()} )",
            ),
          ),
        ),
      ],
    ));
  }

  double getTotalPrice() {
    return (int.parse(widget.position.price) * count).toDouble();
  }

  String priceString() {
    return NumberFormat.currency(
      symbol: "р",
      customPattern: '#,### \u00a4',
    ).format(getTotalPrice());
  }

  Widget getBgCover() {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
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
