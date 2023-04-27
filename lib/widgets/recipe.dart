import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/destination_selector.dart';
import 'package:suxoy_zakon/widgets/dialogs.dart';

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({super.key});

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
                  const Divider(),
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
              onTap: () {},
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
