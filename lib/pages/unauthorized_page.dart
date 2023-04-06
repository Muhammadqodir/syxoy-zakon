import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_btn.dart';

class UnauthorizedPage extends StatelessWidget {
  const UnauthorizedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
            ),
            child: SvgPicture.asset(
              "assets/error.svg",
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Text(
            "Вы не авторизованы",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.040,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomBtn(
              onTap: () {},
              text: "Авторизоваться",
            ),
          )
        ],
      ),
    );
  }
}
