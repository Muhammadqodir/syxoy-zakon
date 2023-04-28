import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

class PrefsItem extends StatelessWidget {
  PrefsItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.desc,
  });

  IconData icon;
  String title;
  String desc;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      onTap: onTap,
      lowerBound: 0.9,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withAlpha(30),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Icon(
            CupertinoIcons.right_chevron,
            size: 20,
            color: textColor.withAlpha(100),
          ),
        ],
      ),
    );
  }
}
