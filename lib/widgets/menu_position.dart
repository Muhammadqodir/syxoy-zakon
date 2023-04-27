import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

class MenuPosition extends StatefulWidget {
  const MenuPosition({super.key, required this.position});

  final MenuItem position;

  @override
  State<MenuPosition> createState() => _MenuPositionState();
}

class _MenuPositionState extends State<MenuPosition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFF302F3C),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 40,
            offset: const Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF302F3C),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 40,
                      offset: const Offset(0, 20), // changes position of shadow
                    ),
                  ],
                ),
                width: double.infinity,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                      widget.position.imageUrl,
                    ),
                  ),
                ),
              ),
              BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                if (state.getCount(widget.position.id) == 0) {
                  return const SizedBox();
                }
                return Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      state.getCount(widget.position.id).toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 32,
            child: Text(
              widget.position.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 13),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OnTapScaleAndFade(
                  child: const Icon(
                    CupertinoIcons.minus,
                    size: 24,
                  ),
                  onTap: () {
                    context.read<CartCubit>().decCart(widget.position);
                  },
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.position.price,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Р",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: primaryColor),
                      ),
                    ],
                  ),
                ),
                OnTapScaleAndFade(
                  child: const Icon(
                    CupertinoIcons.plus,
                    size: 24,
                  ),
                  onTap: () {
                    context.read<CartCubit>().addCart(widget.position);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
