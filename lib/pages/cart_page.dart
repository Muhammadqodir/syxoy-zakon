import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/alt_btn.dart';
import 'package:suxoy_zakon/widgets/cart_item_widget.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  final List<CartItem> items = [
    CartItem(
      item: MenuItem(
        title: "Блинчик с ветчиной и сыром",
        desc: "Блинчик с ветчиной и сыром",
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
        price: "299",
      ),
      count: 3,
    ),
    CartItem(
      item: MenuItem(
        title: "Блинчик с ветчиной и сыром",
        desc: "Блинчик с ветчиной и сыром",
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
        price: "299",
      ),
      count: 3,
    ),
    CartItem(
      item: MenuItem(
        title: "Блинчик с ветчиной и сыром",
        desc: "Блинчик с ветчиной и сыром",
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
        price: "299",
      ),
      count: 3,
    ),
    CartItem(
      item: MenuItem(
        title: "Блинчик с ветчиной и сыром",
        desc: "Блинчик с ветчиной и сыром",
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
        price: "299",
      ),
      count: 3,
    ),
    CartItem(
      item: MenuItem(
        title: "Блинчик с ветчиной и сыром",
        desc: "Блинчик с ветчиной и сыром",
        imageUrl:
            "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/982583865/cheeseburgers.jpg?quality=82&strip=1",
        price: "299",
      ),
      count: 3,
    )
  ];

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SafeArea(
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
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "4 блюда",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          AltBtn(
                            onTap: () {},
                            txtColor: textColor,
                            dropShadow: true,
                            text: "Добавить",
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: widget.items
                        .map(
                          (e) => CartItemWidget(
                            item: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: getReceptWidget(context),
          ),
        ],
      ),
    );
  }

  Container getReceptWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -10), // changes position of shadow
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Цена",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: textColor.withOpacity(0.8)),
                      ),
                      Expanded(
                        child: Text(
                          "1560 Р",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontFamily: "MontserratBold"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "Доставка",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: textColor.withOpacity(0.8)),
                      ),
                      Expanded(
                        child: Text(
                          "Бесплатная",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontFamily: "MontserratBold"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Итого",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: textColor.withOpacity(0.8)),
                      ),
                      Expanded(
                        child: Text(
                          "1560 Р",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontFamily: "MontserratBold"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomBtn(
              margin: const EdgeInsets.all(12),
              onTap: () {},
              dropShadow: true,
              text: "Заказать",
            ),
          ],
        ),
      ),
    );
  }
}
