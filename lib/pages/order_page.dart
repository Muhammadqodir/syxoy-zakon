import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

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
                padding: const EdgeInsets.only(top: 50),
                child: SvgPicture.asset(
                  "assets/orders.svg",
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
            Text(
              "У вас не было заказов",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: CustomBtn(
                  onTap: () {},
                  text: "Заказать",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
