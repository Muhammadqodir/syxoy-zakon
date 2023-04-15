import 'package:flutter/cupertino.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({super.key, required this.icon, required this.onTap});

  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      child: Container(
        width: 50,
        height: 50,
        child: icon,
      ),
      onTap: onTap,
    );
  }
}
