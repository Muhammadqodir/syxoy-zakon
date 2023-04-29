import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/models/order.dart';
import 'package:suxoy_zakon/pages/cart_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';
import 'package:suxoy_zakon/widgets/order_position.dart';
import 'package:suxoy_zakon/widgets/static_grid.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order, required this.api});

  final Order order;
  final Api api;

  Color _getStatusColor() {
    Map<String, Color> colors = {
      "Готово": Colors.green,
      "Принято": Colors.blue,
      "Отменено": Colors.red,
      "Готовится": Colors.orange,
      "В пути": Colors.green,
    };
    return colors[order.status] ?? Colors.grey;
  }

  String _getDate() {
    return order.date.substring(0, 16);
  }

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.9,
      onTap: () {
        showDetailsDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: StaticGrid(
                  gap: 1,
                  children: order.items
                      .take(4)
                      .map(
                        (e) => SizedBox(
                          width: 39.5,
                          height: 39.5,
                          child: Image.network(
                            e.item.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#${order.id}",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: _getStatusColor(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      order.status,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "${order.price} Р",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                        child: Text(
                          _getDate(),
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDetailsDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: ListView(
            children: [
              Text(
                "Номер заказа: ${order.id}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: _getStatusColor(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      order.status,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Позиции:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Column(
                children:
                    order.items.map((e) => OrderPosition(item: e)).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Адресс доставки:",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: textColor.withOpacity(0.8)),
                        ),
                        Expanded(
                          child: Text(
                            order.delivery.title,
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
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Способ оплаты:",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: textColor.withOpacity(0.8)),
                        ),
                        Expanded(
                          child: Text(
                            order.paymentMethod,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontFamily: "MontserratBold"),
                          ),
                        ),
                      ],
                    ),
                    if (order.note.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Примечания к заказу:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: textColor.withOpacity(0.8)),
                          ),
                          Text(
                            order.note,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontFamily: "MontserratBold"),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Итого:",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: textColor.withOpacity(0.8)),
                        ),
                        Expanded(
                          child: Text(
                            "${order.price} Р",
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
              order.status == "Готово"
                  ? CustomBtn(
                      onTap: () {
                        context.read<CartCubit>().clearCart();
                        for (CartItem item in order.items) {
                          context
                              .read<CartCubit>()
                              .addCartWithCount(item.item, item.count);
                        }
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CartPage(api: api),
                          ),
                        );
                      },
                      margin: const EdgeInsets.all(12),
                      text: "Повторить",
                    )
                  : CustomBtn(
                      onTap: () {},
                      icon: const Icon(
                        CupertinoIcons.phone,
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.all(12),
                      text: "Позвонить",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
