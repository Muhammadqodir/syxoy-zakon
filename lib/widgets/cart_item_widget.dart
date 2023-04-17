import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/models/cart_item.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/icon_btn.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key, required this.item});

  final CartItem item;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  widget.item.item.imageUrl,
                ),
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
                  widget.item.item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "${widget.item.item.price} Р",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4,),
                IconBtn(
                  size: 30,
                  icon: const Icon(
                    CupertinoIcons.minus,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                Expanded(
                  child: Center(
                    child: Text(widget.item.count.toString(),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)),
                  ),
                ),
                IconBtn(
                  size: 30,
                  icon: const Icon(
                    CupertinoIcons.plus,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 4,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
