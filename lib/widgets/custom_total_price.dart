import 'package:flutter/material.dart';

class CustomPriceCounter extends StatefulWidget {
  final Color color;
  final int initialValue;
  final Function(int value) onChanged;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final double buttonWidth;
  final double buttonHeight;

  CustomPriceCounter({
    required this.initialValue,
    required this.onChanged,
    required this.color,
    required this.borderRadius,
    this.height = 40,
    this.width = 140,
    this.buttonWidth = 40,
    this.buttonHeight = 40,
  });

  @override
  _CustomPriceCounterState createState() => _CustomPriceCounterState();
}

class _CustomPriceCounterState extends State<CustomPriceCounter> {
  late int _price;
  late int _count;

  @override
  void initState() {
    super.initState();
    _price = widget.initialValue;
    _count = 1;
  }

  void _increment() {
    setState(() {
      _count++;
      _price = widget.initialValue * _count;
    });
    widget.onChanged(_price);
  }

  void _decrement() {
    if (_count > 1) {
      setState(() {
        _count--;
        _price = widget.initialValue * _count;
      });
      widget.onChanged(_price);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: _count > 1,
            child: SizedBox(
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              child: IconButton(
                onPressed: _decrement,
                icon: Icon(
                  Icons.remove,
                  color: widget.color,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '$_price Р',
              style: TextStyle(
                fontSize: 16,
                color: widget.color,
                fontFamily: "Montserrat-light",
              ),
            ),
          ),
          SizedBox(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            child: IconButton(
              onPressed: _increment,
              icon: Icon(
                Icons.add,
                color: widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
