import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suxoy_zakon/pages/register_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/hamburger.svg",
              ),
              Text(
                "Хочешь кушать?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Тогда ты по адресу, быстрее проходи регистрацию и выбирай вкусную еду.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: textColor.withOpacity(0.8)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomBtn(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                text: "Начать",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
