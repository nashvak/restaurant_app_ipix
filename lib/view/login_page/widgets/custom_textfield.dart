import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool obscure;
  final IconButton? sufiixIcon;
  const CustomTextfield(
      {required this.text,
      super.key,
      required this.controller,
      required this.validator,
      this.obscure = false,
      required this.keyboardType,
      this.sufiixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscure,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: sufiixIcon,
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Appcolors.appColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Appcolors.appColor),
          ),
        ),
      ),
    );
  }
}
