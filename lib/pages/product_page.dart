import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/pages/cart_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/icon_btn.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.position, required this.api});
  final MenuItem position;
  final Api api;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    CartState state = context.watch<CartCubit>().state;
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
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                          state.getCount(widget.position.id) !=
                                                  0
                                              ? primaryColor
                                              : textColor,
                                    ),
                                    onTap: () {
                                      context
                                          .read<CartCubit>()
                                          .decCart(widget.position);
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
                                          state
                                              .getCount(widget.position.id)
                                              .toString(),
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
                                      context
                                          .read<CartCubit>()
                                          .addCart(widget.position);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              widget.position.title,
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
                                const SizedBox(
                                  width: 2,
                                ),
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
                                    widget.position.desc,
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
        if (state.items.isNotEmpty)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: CustomBtn(
                margin: const EdgeInsets.all(12),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CartPage(api: widget.api),
                    ),
                  );
                },
                dropShadow: true,
                text: "В корзину (${state.getTotalPrice()}Р)",
              ),
            ),
          ),
      ],
    ));
  }

  double getTotalPrice(int count) {
    return (int.parse(widget.position.price) * count).toDouble();
  }

  String priceString(int count) {
    return NumberFormat.currency(
      symbol: "Р",
      customPattern: '#,### \u00a4',
    ).format(getTotalPrice(count));
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
          child: Image.network(widget.position.imageUrl),
        ),
      ),
    );
  }
}
