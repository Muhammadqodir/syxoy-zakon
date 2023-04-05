import 'package:flutter/material.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_count.dart';

class FoodDescriptionPage extends StatefulWidget {
  const FoodDescriptionPage({super.key});

  @override
  State<FoodDescriptionPage> createState() => _FoodDescriptionPageState();
}

class _FoodDescriptionPageState extends State<FoodDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/image3.png',
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 330),
                  child: Center(
                    child: CustomCount(
                      iconSize: 34,
                      containerColor: Theme.of(context).scaffoldBackgroundColor,
                      initialValue: 0,
                      height: 60,
                      width: 150,
                      onChanged: (v) {},
                      textcolor: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Блинчик с ветчиной и сыром",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "PlayfairBold",
                    fontSize: 31,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "105 Р",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55, right: 280),
                  child: Text(
                    "Состав",
                    style: TextStyle(
                      fontFamily: "PlayfairBold",
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 5, right: 15),
                  child: Text(
                    "Ветчина куриная,плавленный сыр,зелень",
                    style: TextStyle(fontFamily: "Montserrat-light"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 25, right: 25),
                  child: CustomBtn(
                    onTap: () {},
                    text: "Добавить в корзину (210 Р)",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
