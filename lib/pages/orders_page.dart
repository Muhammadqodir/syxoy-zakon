import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key, required this.api});

  final Api api;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Positioned(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ActionBtn(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              accentColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              icon: const Icon(
                                CupertinoIcons.arrow_left,
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Заказы",
                                style: Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
