import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/models/order.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';
import 'package:suxoy_zakon/widgets/order_widger.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key, required this.api});

  final Api api;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> orders = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  _fillData() async {
    Response<List<Order>> response = await widget.api.getMyOrders();
    if (response.success) {
      setState(() {
        orders = response.data!;
      });
    } else {
      Dialogs.showAlertDialog(
        context,
        "Ошибка",
        response.message,
      );
    }
  }

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
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
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
                    child: CustomScrollView(
                      controller: _controller,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: [
                        CupertinoSliverRefreshControl(
                          onRefresh: () async {
                            _fillData();
                          },
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Column(
                                children: orders
                                    .map(
                                      (e) => OrderWidget(
                                        order: e,
                                        api: widget.api,
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      ],
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
