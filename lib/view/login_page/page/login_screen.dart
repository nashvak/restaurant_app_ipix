import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app_ipix/view/login_page/widgets/custom_textfield.dart';
import 'package:restaurant_app_ipix/view/login_page/widgets/login_button.dart';
import 'package:restaurant_app_ipix/view_model/splash_screen_contoller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SplashScreenController splash = SplashScreenController();
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
                const SizedBox(height: 10),
                const Text(
                  "Log in\nyour account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  text: 'Email',
                  controller: emailController,
                  validator: () {},
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  text: 'Password',
                  sufiixIcon: const Icon(Icons.visibility_off),
                  obscure: true,
                  controller: passwordController,
                  validator: () {},
                  keyboardType: TextInputType.visiblePassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text("Remember me"),
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                LoginButton(
                  title: 'Log in',
                  onTap: () async {
                    var pref = await SharedPreferences.getInstance();
                    pref.setBool(splash.keyToLogin, true);
                    pref.setString(splash.email, emailController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
