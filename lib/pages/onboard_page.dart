import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/onboarding.svg',
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
              Center(
                child: Text(
                  "Хочешь кушать?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Тогда ты по адресу,быстрее проходи регистрацию и выбирай вкусную еду.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat-light",
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: CustomBtn(
                  onTap: () {},
                  text: "Начать",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
