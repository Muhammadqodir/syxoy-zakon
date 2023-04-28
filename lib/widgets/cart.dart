import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/pages/cart_page.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartState state = context.watch<CartCubit>().state;
    return Stack(
      children: [
        ActionBtn(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
          accentColor: Theme.of(context).scaffoldBackgroundColor,
          icon: SvgPicture.asset(
            "assets/cart.svg",
            width: 30,
          ),
        ),
        if (state.getTotalPrice() > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Text(
                state.getAllCount().toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
