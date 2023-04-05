import 'package:flutter/material.dart';

class CustomCount extends StatefulWidget {
  final Color textcolor;
  final int initialValue;
  final Function(int value) onChanged;
  BorderRadius borderRadius;
  final double width;
  final double height;
  final double iconSize;
  final Color containerColor;

  CustomCount(
      {required this.initialValue,
      required this.onChanged,
      required this.textcolor,
      required this.borderRadius,
      this.height = 40,
      this.width = 110,
      this.iconSize = 24,
      required this.containerColor});

  @override
  _CustomCountState createState() => _CustomCountState();
}

class _CustomCountState extends State<CustomCount> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.initialValue;
  }

  void _increment() {
    if (_count < 10) {
      setState(() {
        _count++;
        widget.onChanged(_count);
      });
    }
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
        widget.onChanged(_count);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        color: widget.containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: _decrement,
            icon: Icon(
              Icons.remove,
              color: widget.textcolor,
              size: widget.iconSize,
            ),
          ),
          Text(
            '$_count',
            style: TextStyle(
              fontSize: widget.iconSize,
              color: widget.textcolor,
            ),
          ),
          IconButton(
            onPressed: _increment,
            icon: Icon(
              Icons.add,
              color: widget.textcolor,
              size: widget.iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
