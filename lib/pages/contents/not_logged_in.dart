import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class NotLoggedIn extends StatelessWidget {
  const NotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/404.svg"),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Вы не авторизованы",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomBtn(
            onTap: () {},
            text: "Авторизоваться",
            dropShadow: true,
            margin: const EdgeInsets.symmetric(horizontal: 24),
          )
        ],
      ),
    );
  }
}
