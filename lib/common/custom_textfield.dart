import 'package:flutter/material.dart';

import '../constants/global_variables.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final VoidCallback validator;
  final TextInputType keyboardType;
  final bool obscure;
  const CustomTextfield(
      {required this.text,
      super.key,
      required this.controller,
      required this.validator,
      this.obscure = false,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscure,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolors.appColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolors.appColor),
          ),
        ),
      ),
    );
  }
}
