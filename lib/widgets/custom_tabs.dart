import 'package:flutter/material.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class CustomTabs extends StatefulWidget {
  const CustomTabs({super.key, required this.tabs, required this.onChanged});

  final List<String> tabs;
  final Function(int index) onChanged;

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.tabs
            .map(
              (e) => CustomBtn(
                onTap: (){
                  setState(() {
                    selectedIndex = widget.tabs.indexOf(e);
                  });
                  widget.onChanged(widget.tabs.indexOf(e));
                },
                borderRadius: BorderRadius.circular(16),
                padding: EdgeInsets.symmetric(horizontal: 12),
                margin: EdgeInsets.symmetric(horizontal: 6),
                accentColor: selectedIndex == widget.tabs.indexOf(e)
                    ? primaryColor
                    : const Color(0xFFF9F9F9),
                text: e,
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: selectedIndex == widget.tabs.indexOf(e)
                        ? Colors.white
                        : textColor),
              ),
            )
            .toList(),
      ),
    );
  }
}
