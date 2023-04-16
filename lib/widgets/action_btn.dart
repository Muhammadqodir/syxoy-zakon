import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suxoy_zakon/theme.dart';

class ActionBtn extends StatefulWidget {
  ActionBtn({
    Key? key,
    // required this.child,
    required this.onTap,
    this.height = 60,
    this.width = double.infinity,
    this.accentColor = primaryColor,
    this.textColor = Colors.white,
    required this.icon,
    this.dropShadow = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  double height = 60;
  double width = double.infinity;
  Color accentColor = primaryColor;
  bool dropShadow = false;
  Color textColor = const Color(0xFFFFFFFF);
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(25));
  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12);
  EdgeInsets margin = const EdgeInsets.all(0);
  Widget icon;
  final void Function() onTap;

  @override
  State<ActionBtn> createState() => _ActionBtnState();
}

class _ActionBtnState extends State<ActionBtn> {
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
            width: widget.height,
            decoration: BoxDecoration(
              color: widget.accentColor,
              borderRadius: widget.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [widget.icon],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
