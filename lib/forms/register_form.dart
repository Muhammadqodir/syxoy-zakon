import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:suxoy_zakon/models/form_data.dart';
import 'package:suxoy_zakon/widgets/custom_select.dart';
import 'package:suxoy_zakon/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key, this.initPhone = ""});

  final String initPhone;
  final phoneController = TextEditingController();

  bool isLoading = false;
  String getPhone() {
    return phoneController.text
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "");
  }

  FormDataModel validateForm(){
    String phone = getPhone();
    log(phone.length.toString());
    if(phone.length != 12){
      return FormDataModel.inValid(message: "Неверный формат номера телефона");
    }
    return FormDataModel(data: phone);
  }

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: const Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
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
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: widget.phoneController,
                  onChanged: (v) {},
                  hint: "Номер телефона",
                  inputFormatter: [
                  MaskTextInputFormatter(
                    mask: '+7 (###) ###-##-##',
                    filter: {"#": RegExp(r'[0-9]')},
                    type: MaskAutoCompletionType.lazy,
                  )
                ],
                inputType: TextInputType.phone,
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
