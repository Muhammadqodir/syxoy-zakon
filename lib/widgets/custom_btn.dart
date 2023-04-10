import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suxoy_zakon/theme.dart';

class CustomBtn extends StatefulWidget {
  CustomBtn({
    Key? key,
    // required this.child,
    required this.onTap,
    this.height = 60,
    this.width = double.infinity,
    this.accentColor = primaryColor,
    this.textColor = Colors.white,
    this.icon,
    required this.text,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  double height = 60;
  double width = double.infinity;
  Color accentColor = primaryColor;
  Color textColor = const Color(0xFFFFFFFF);
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(25));
  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12);
  EdgeInsets margin = const EdgeInsets.all(0);
  Widget? icon;
  String text;
  final void Function() onTap;

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  bool isOnTap = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (details) {
          setState(() {
            isOnTap = true;
          });
        },
        onTapCancel: () {
          setState(() {
            isOnTap = false;
          });
        },
        onTapUp: (details) {
          setState(() {
            isOnTap = false;
          });
        },
        child: AnimatedOpacity(
          opacity: isOnTap ? 0.8 : 1,
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.accentColor,
              borderRadius: widget.borderRadius,
            ),
            child: Padding(
              padding: widget.padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.icon != null
                      ? Row(
                          children: [
                            widget.icon!,
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        )
                      : const SizedBox(),
                  Text(
                    widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: widget.textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
