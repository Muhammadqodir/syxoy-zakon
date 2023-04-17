import 'package:flutter/cupertino.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 50,
  });

  final Widget icon;
  final Function() onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: icon,
      ),
    );
  }
}
