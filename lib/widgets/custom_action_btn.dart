import 'package:flutter/material.dart';
import 'package:suxoy_zakon/theme.dart';

class CustomActionButton extends StatefulWidget {
  double width = 55;
  double height = 55;
  Color accentcolor = lightGray;
  final IconData icon;
  final Color color;
  CustomActionButton(
      {Key? key,
      required this.icon,
      required this.color,
      required this.accentcolor})
      : super(key: key);

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  bool isOntap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (details) {
        setState(() {
          isOntap = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isOntap = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isOntap = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: isOntap
              ? widget.accentcolor.withAlpha(180)
              : widget.accentcolor.withAlpha(255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.color,
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(-1, -3),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: 22,
            color: Theme.of(context).shadowColor,
          ),
        ),
      ),
    );
  }
}
