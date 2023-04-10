import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

const double _kItemExtent = 32.0;

class CustomSelect extends StatefulWidget {
  final String hint;
  final TextAlign textAlign;
  BorderRadius borderRadius;
  List<String> items;
  final Function(int) onChanged;
  Color baseColor;
  EdgeInsets margin = const EdgeInsets.all(0);
  EdgeInsets padding = const EdgeInsets.all(0);

  CustomSelect({
    this.hint = "",
    required this.onChanged,
    required this.items,
    this.textAlign = TextAlign.start,
    this.baseColor = Colors.black12,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
  });

  _CustomSelectState createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  Color currentColor = Colors.black12;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    currentColor = widget.baseColor;
    if(widget.items.isNotEmpty){
      selectedIndex = 0;
    }else{
      selectedIndex = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: OnTapScaleAndFade(
        lowerBound: 0.95,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.baseColor,
            borderRadius: widget.borderRadius,
          ),
          child: Padding(
            padding: widget.padding,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedIndex >= 0 && widget.items.isNotEmpty
                        ? widget.items[selectedIndex]
                        : widget.hint,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                widget.items.isEmpty
                    ? const CupertinoActivityIndicator(radius: 12,)
                    : const Icon(CupertinoIcons.chevron_down, size: 18,)
              ],
            ),
          ),
        ),
        onTap: () {
          if (widget.items.isNotEmpty) {
            showSelectDialog();
          }
        },
      ),
    );
  }

  void showSelectDialog() {
    FixedExtentScrollController extentScrollController =
        FixedExtentScrollController(
            initialItem: selectedIndex < 0 ? 0 : selectedIndex);
    showCupertinoModalPopup<void>(
      context: this.context,
      builder: (BuildContext context) => Container(
        height: 250,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: CupertinoPicker(
                  scrollController: extentScrollController,
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: false,
                  looping: false,
                  itemExtent: _kItemExtent,
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    SystemSound.play(SystemSoundType.click);
                    HapticFeedback.mediumImpact();
                  },
                  children:
                      List<Widget>.generate(widget.items.length, (int index) {
                    return Center(
                      child: Text(
                        widget.items[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }),
                ),
              ),
              CupertinoButton(
                child: Text(
                  "Выбрать",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = extentScrollController.selectedItem;
                  });
                  widget.onChanged(selectedIndex);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
