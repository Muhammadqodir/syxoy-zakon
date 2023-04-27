import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({
    super.key,
    required this.selIndex,
    required this.items,
    required this.onChanged,
  });
  int selIndex;
  List<CustomBottomNavItem> items;
  void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: items
              .map(
                (e) => Expanded(
                  child: Center(
                    child: OnTapScaleAndFade(
                      onTap: () {
                        onChanged(items.indexOf(e));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: selIndex == items.indexOf(e)
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          e.icon,
                          size: 24,
                          color: selIndex == items.indexOf(e)
                              ? Colors.white
                              : textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CustomBottomNavItem {
  String title;
  IconData icon;
  CustomBottomNavItem(this.title, this.icon);
}
