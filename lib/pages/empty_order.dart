import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class EmptyOrderPage extends StatelessWidget {
  const EmptyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: CustomActionButton(
                    accentcolor: Theme.of(context).scaffoldBackgroundColor,
                    icon: Icons.arrow_back,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SvgPicture.asset(
                  "assets/empty.svg",
                  height: MediaQuery.of(context).size.height * 0.41,
                ),
              ),
            ),
            Text(
              "Ваша корзина пуста",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: CustomBtn(onTap: () {}, text: "Заказать"),
            )
          ],
        ),
      ),
    );
  }
}
