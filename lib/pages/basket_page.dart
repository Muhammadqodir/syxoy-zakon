import 'package:flutter/material.dart';
import 'package:suxoy_zakon/widgets/custom_action_btn.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_count.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
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
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: const Text(
                    "4 Блюда",
                    style: TextStyle(
                      fontFamily: "Monserrat-light",
                      fontSize: 22,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.4,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            "Добавить",
                            style: TextStyle(
                              fontFamily: "Montserrat-light",
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundImage:
                                const AssetImage('assets/burger.png'),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Бургер №1",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8, left: 30),
                                child: Text(
                                  "320Р",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Montserrat-light",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomCount(
                            containerColor: Theme.of(context).primaryColor,
                            height: 40,
                            initialValue: 0,
                            onChanged: (v) {},
                            textcolor:
                                Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundImage:
                                const AssetImage('assets/pizza.png'),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Бургер №2",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8, left: 30),
                                child: Text(
                                  "320Р",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Montserrat-light",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomCount(
                            height: 40,
                            containerColor: Theme.of(context).primaryColor,
                            initialValue: 0,
                            onChanged: (v) {},
                            textcolor:
                                Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundImage:
                                const AssetImage('assets/burger.png'),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Бургер №3",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8, left: 30),
                                child: Text(
                                  "320Р",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Montserrat-light",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomCount(
                            containerColor: Theme.of(context).primaryColor,
                            height: 40,
                            initialValue: 0,
                            onChanged: (v) {},
                            textcolor:
                                Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 31,
                            backgroundImage:
                                const AssetImage('assets/pizza.png'),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Бургер №4",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8, left: 30),
                                child: Text(
                                  "320Р",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Montserrat-light",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomCount(
                            height: 40,
                            containerColor: Theme.of(context).primaryColor,
                            initialValue: 0,
                            onChanged: (v) {},
                            textcolor:
                                Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Material(
                  elevation: 15,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.020,
                                left: MediaQuery.of(context).size.width * 0.040,
                              ),
                              child: Text(
                                "Цена",
                                style: TextStyle(
                                  fontFamily: "Montserrat-light",
                                  fontSize: 18,
                                  color: Theme.of(context).shadowColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, top: 20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "1560 Р",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                child: Text(
                                  "Доставка",
                                  style: TextStyle(
                                    fontFamily: "Montserrat-light",
                                    fontSize: 19,
                                    color: Theme.of(context).shadowColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                child: Text(
                                  "Бесплатная",
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.025,
                            right: MediaQuery.of(context).size.width * 0.025,
                            bottom: MediaQuery.of(context).size.height * 0.010,
                            top: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Divider(
                            thickness: 3,
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                child: Text(
                                  "Итого",
                                  style: TextStyle(
                                    fontFamily: "Montserrat-light",
                                    fontSize: 19,
                                    color: Theme.of(context).shadowColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                child: Text(
                                  "1560 Р",
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.020,
                            ),
                            child: CustomBtn(
                              onTap: () {},
                              text: "Заказать",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
