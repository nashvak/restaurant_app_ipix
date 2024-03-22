import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app_ipix/common/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset('assets/lottie/login_logo.json', height: 300),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Log in\nyour account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    text: 'User name',
                    controller: emailController,
                    validator: () {},
                    keyboardType: TextInputType.emailAddress),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
