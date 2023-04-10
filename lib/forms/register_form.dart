import 'package:flutter/material.dart';
import 'package:suxoy_zakon/widgets/custom_select.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Код страны",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                CustomSelect(
                  onChanged: (v) {},
                  items: const ["Россия(+7)"],
                  baseColor: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.all(0),
                  borderRadius: BorderRadius.circular(0),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1.5,
            color: Color(0xFFE6E6E6),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: TextEditingController(),
                  onChanged: (v) {},
                  hint: "Номер телефона",
                  padding: const EdgeInsets.all(0),
                  baseColor: Theme.of(context).scaffoldBackgroundColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
