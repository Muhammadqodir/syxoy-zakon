import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/widgets/alt_btn.dart';
import 'package:suxoy_zakon/widgets/cart_item_widget.dart';
import 'package:suxoy_zakon/widgets/recipe.dart';

class ContentCart extends StatefulWidget {
  const ContentCart({super.key});

  @override
  State<ContentCart> createState() => _ContentCartState();
}

class _ContentCartState extends State<ContentCart> {
  Api api = Api();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initApi();
  }

  _initApi() async {
    String token = (await SharedPreferences.getInstance()).getString("token") ??
        "undefined";
    api = Api(token: token);
    print(token);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    CartState state = context.watch<CartCubit>().state;
    return Stack(
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
                          Expanded(
                            child: Text(
                              "Корзина",
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                state.items.isNotEmpty
                    ? Expanded(
                        child: ListView(
                          physics: AlwaysScrollableScrollPhysics(),
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
                              api: api,
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
    );
  }
}
