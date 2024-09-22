import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  TextEditingController controller;
  String placeholder;
  String label;
  bool isPassword;
  FormInput(
      {required this.controller,
      required this.label,
      required this.placeholder,
      required this.isPassword,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: placeholder,
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,

          ),
        ),
      ],
    );
  }
}
