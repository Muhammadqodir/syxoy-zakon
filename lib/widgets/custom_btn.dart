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
    this.textStyle,
    required this.text,
    this.dropShadow = false,
    this.alignment = MainAxisAlignment.center,
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
  MainAxisAlignment alignment;
  TextStyle? textStyle;
  bool dropShadow;
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
          opacity: isOnTap ? 0.7 : 1,
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
                color: widget.accentColor,
                borderRadius: widget.borderRadius,
                boxShadow: widget.dropShadow
                    ? [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    : []),
            child: Padding(
              padding: widget.padding,
              child: Row(
                mainAxisAlignment: widget.alignment,
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
                    style: widget.textStyle ??
                        Theme.of(context)
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
