import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/pages/orders_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';
import 'package:suxoy_zakon/widgets/destination_selector.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';
import 'package:suxoy_zakon/widgets/payment_method_selector.dart';

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({super.key, required this.api, this.pushReplace = false});

  final Api api;
  final bool pushReplace;
  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  List<Destination> destinations = [];

  @override
  void initState() {
    super.initState();
    getDestinations();
  }

  int selectedDestination = -1;
  bool isLoading = false;
  List<String> paymentMethods = [
    "Самовывоз",
    "Курьеру наличными",
    "Курьеру картой",
  ];
  int selectedPayment = -1;

  getDestinations() async {
    Response<List<Destination>> response =
        await Api().getDeliveryDestinations();
    if (response.success) {
      destinations = response.data!;
      setState(() {});
    } else {
      Dialogs.showAlertDialog(context, "Error", response.message);
    }
  }

  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CartState state = context.watch<CartCubit>().state;

    int _getTotalPrice() {
      if (destinations.isEmpty || selectedDestination < 0) {
        return state.getTotalPrice();
      } else {
        return state.getTotalPrice() + destinations[selectedDestination].price;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Цена",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: textColor.withOpacity(0.8)),
                      ),
                      Expanded(
                        child: Text(
                          "${state.getTotalPrice()} Р",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontFamily: "MontserratBold"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DestinationSelector(
                    baseColor: Colors.grey.withAlpha(50),
                    onChanged: (index) {
                      setState(() {
                        selectedDestination = index;
                      });
                    },
                    hint: "Выберите адресс",
                    items: destinations,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: _noteController,
                    hint: "Примечания к заказу",
                    baseColor: Colors.grey.withAlpha(50),
                    onChanged: (v) {},
                  ),
                  const Divider(),
                  // PaymentMethodSelector(
                  //   baseColor: Colors.grey.withAlpha(50),
                  //   onChanged: (index) {
                  //     setState(() {
                  //       selectedPayment = index;
                  //     });
                  //   },
                  //   hint: "Способ оплаты",
                  //   items: paymentMethods,
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Итого",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: textColor.withOpacity(0.8)),
                      ),
                      Expanded(
                        child: Text(
                          "${_getTotalPrice()} Р",
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontFamily: "MontserratBold"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomBtn(
              margin: const EdgeInsets.all(12),
              isLogin: isLoading,
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                if (state.items.isNotEmpty && selectedDestination >= 0) {
                  Response<bool> response = await widget.api.newOrder(
                      state.items,
                      destinations[selectedDestination],
                      state.getTotalPrice().toString(),
                      "-",
                      _noteController.text);
                  if (response.success) {
                    context.read<CartCubit>().clearCart();
                    setState(() {
                      isLoading = false;
                    });
                    if (widget.pushReplace) {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OrdersPage(api: widget.api),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OrdersPage(api: widget.api),
                        ),
                      );
                    }
                  } else {
                    Dialogs.showAlertDialog(
                      context,
                      "Ошибка",
                      response.message,
                    );
                    setState(() {
                      isLoading = false;
                    });
                  }
                } else {
                  Dialogs.showAlertDialog(
                    context,
                    "Сухой законъ",
                    "Заполните все поля",
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              dropShadow: true,
              text: "Заказать",
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
