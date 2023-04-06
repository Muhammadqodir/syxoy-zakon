import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class SuccesfullOrderPage extends StatefulWidget {
  const SuccesfullOrderPage({super.key});

  @override
  State<SuccesfullOrderPage> createState() => _SuccesfullOrderPageState();
}

class _SuccesfullOrderPageState extends State<SuccesfullOrderPage> {
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
                    icon: Icons.arrow_back,
                    color: Theme.of(context).dividerColor,
                    accentcolor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            Center(
              child: SvgPicture.asset(
                'assets/succesfull-order.svg',
                height: MediaQuery.of(context).size.height * 0.55,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Material(
                    elevation: 30,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Заказ принят",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                "с вами свяжется наш диспетчер для уточнения деталей заказа",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Montserrat-light",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomBtn(
                                onTap: () {},
                                text: "Детали заказа",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
