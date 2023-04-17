import 'package:flutter/material.dart';

class AltBtn extends StatefulWidget {
  const AltBtn({
    Key? key,
    // required this.child,
    required this.onTap,
    this.height = 45,
    this.width = double.infinity,
    this.accentColor = Colors.white,
    this.txtColor = Colors.white,
    this.icon,
    this.textStyle,
    required this.text,
    this.dropShadow = false,
    this.alignment = MainAxisAlignment.center,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  final double height;
  final double width;
  final Color accentColor;
  final Color txtColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final MainAxisAlignment alignment;
  final TextStyle? textStyle;
  final bool dropShadow;
  final Widget? icon;
  final String text;
  final void Function() onTap;

  @override
  State<AltBtn> createState() => _AltBtnState();
}

class _AltBtnState extends State<AltBtn> {
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
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
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
                            .bodyMedium!
                            .copyWith(color: widget.txtColor),
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
