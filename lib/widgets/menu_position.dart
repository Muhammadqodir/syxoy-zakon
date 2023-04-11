import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            offset: Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      child: Column(
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
                  offset: Offset(0, 20), // changes position of shadow
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
          const SizedBox(
            height: 12,
          ),
          Text(
            widget.position.title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                OnTapScaleAndFade(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.minus,
                    size: 18,
                  ),
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
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.plus,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
