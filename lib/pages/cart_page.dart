import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/alt_btn.dart';
import 'package:suxoy_zakon/widgets/cart_item_widget.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/destination_selector.dart';
import 'package:suxoy_zakon/widgets/recipe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.api});

  final Api api;
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    CartState state = context.watch<CartCubit>().state;
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
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        state.items.isNotEmpty
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Блюд: ${state.getAllCount()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  AltBtn(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    txtColor: textColor,
                                    dropShadow: true,
                                    text: "Добавить",
                                  )
                                ],
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  state.items.isNotEmpty
                      ? Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Column(
                                children: state.items
                                    .map(
                                      (e) => Column(
                                        children: [
                                          CartItemWidget(
                                            item: e,
                                          ),
                                          SizedBox(
                                            height:
                                                state.items.last == e ? 100 : 0,
                                          )
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                              RecipeWidget(
                                api: widget.api,
                              )
                            ],
                          ),
                        )
                      : Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/empty_cart.svg"),
                              Text(
                                "Ваша корзина пуста",
                                style: Theme.of(context).textTheme.titleLarge,
                              )
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
